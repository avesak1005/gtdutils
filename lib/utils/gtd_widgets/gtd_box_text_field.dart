import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_utils/helpers/extension/colors_extension.dart';
import 'package:gtd_utils/helpers/extension/image_extension.dart';

import '../../base/view_model/gtd_validate_field_vm.dart';
import '../../data/configuration/color_config/app_color.dart';
import '../cubit/gtd_text_field_validation_cubit.dart';
import 'gtd_call_back.dart';
import 'gtd_input/gtd_input_msc.dart';

class GtdBoxTextField extends StatelessWidget {
  final GtdValidateFieldVM viewModel;

  final Widget? leftIcon;
  final Widget? rightIcon;
  final double? height;
  final bool isBoldTextWhenEmpty;
  final EdgeInsets? contentPadding;
  final BoxDecoration? boxBorder;
  final InputBorder? border;
  final bool isDisable;
  final VoidCallback? onSelect;
  final GtdCallback? onChanged;

  const GtdBoxTextField({
    super.key,
    required this.viewModel,
    this.leftIcon,
    this.rightIcon,
    this.height,
    this.contentPadding,
    this.boxBorder,
    this.border = InputBorder.none,
    this.isDisable = false,
    this.isBoldTextWhenEmpty = false,
    this.onSelect,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GtdTextFieldValidationCubit()..initTextFieldVM(viewModel),
      child: BlocBuilder<GtdTextFieldValidationCubit, GtdTextFieldValidationState>(
        builder: (context, state) {
          return StreamBuilder(
            stream: BlocProvider.of<GtdTextFieldValidationCubit>(context).validationCombineStream(),
            initialData: viewModel,
            builder: (context, snapshot) {
              bool isValid = !snapshot.hasError;
              String errorMess = snapshot.error.toString();
              var colorIcon =
                  (isValid) ? Color.fromRGBO(18, 24, 38, isDisable ? 0.4 : 1) : Theme.of(context).colorScheme.error;
              var borderColor = (isValid) ? GtdColors.blueGrey : Theme.of(context).colorScheme.error;
              var borderTF = border;
              bool hasText = (viewModel.controllerSearch.text.isNotEmpty);
              return Column(
                children: [
                  Container(
                    height: height ?? 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: GestureDetector(
                        onTap: isDisable ? null : onSelect,
                        child: TextFormField(
                          key: viewModel.focusfield.formFieldKey,
                          enableIMEPersonalizedLearning: false,
                          autocorrect: false,
                          enableSuggestions: false,
                          scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          controller: viewModel.controllerSearch,
                          keyboardType:
                              viewModel.type.keyboardType == TextInputType.name ? null : viewModel.type.keyboardType,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(viewModel.type.typingExpression),
                            ),
                          ],
                          onChanged: (value) {
                            BlocProvider.of<GtdTextFieldValidationCubit>(context).updateValueTF(value);
                            onChanged?.call(value);
                          },
                          textCapitalization: viewModel.type != GtdTextFieldType.email
                              ? TextCapitalization.sentences
                              : TextCapitalization.none,
                          focusNode: viewModel.focusfield.focusNode,
                          enabled: viewModel.isEnable,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: hasText ? FontWeight.w600 : FontWeight.w400,
                            color: AppColors.boldText,
                          ),
                          cursorHeight: 15,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: borderTF,
                            focusedBorder: borderTF,
                            focusedErrorBorder: borderTF,
                            enabledBorder: borderTF,
                            errorBorder: borderTF,
                            disabledBorder: borderTF,
                            labelStyle: WidgetStateTextStyle.resolveWith((states) {
                              bool hasBoldColor = !isDisable && isBoldTextWhenEmpty;
                              // Color labelColor = (isValid)
                              //     ? Color.fromRGBO(0, 0, 0, isDisable ? 0.4 : 1)
                              //     : Theme.of(context).colorScheme.error;
                              var disableStyle = TextStyle(
                                color: (hasText || hasBoldColor) ? AppColors.boldText : AppColors.subText,
                                fontSize: 15,
                                fontWeight: hasText ? FontWeight.w500 : FontWeight.w400,
                              );
                              var enableStyle = TextStyle(
                                color: (hasText || hasBoldColor) ? AppColors.boldText : AppColors.subText,
                                fontSize: 15,
                                fontWeight: hasText ? FontWeight.w600 : FontWeight.w400,
                              );

                              if (states.contains(WidgetState.disabled)) {
                                return disableStyle;
                              } else {
                                return enableStyle;
                              }
                            }),
                            labelText: viewModel.inputLabel,
                            // labelText: viewModel.inputLabel,
                            // hintText: viewModel.inputPlaceholder,
                            hintStyle: TextStyle(fontSize: 15, color: AppColors.subText),
                            errorStyle: const TextStyle(height: 0),
                            floatingLabelStyle: TextStyle(
                              color: Colors.grey.shade500,
                              // fontSize: 13,
                            ),
                            // floatingLabelBehavior: !viewModel.hasFloatLabel
                            //     ? FloatingLabelBehavior.never
                            //     : isValid
                            //         ? FloatingLabelBehavior.auto
                            //         : FloatingLabelBehavior.always,
                            floatingLabelBehavior:
                                !viewModel.hasFloatLabel ? FloatingLabelBehavior.never : FloatingLabelBehavior.auto,
                            contentPadding: contentPadding ??
                                const EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 0,
                                ),
                            prefixIcon: (leftIcon != null)
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      left: contentPadding?.left ?? 0,
                                      right: 12,
                                    ),
                                    child: SizedBox(child: leftIcon),
                                  )
                                : null,
                            prefixIconColor: colorIcon,
                            suffixIcon: (rightIcon != null)
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: contentPadding?.right ?? 0,
                                    ),
                                    child: SizedBox(child: rightIcon),
                                  )
                                : null,
                            suffixIconColor: colorIcon,
                          ),
                          validator: (value) {
                            return "";
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                    ),
                  ),
                  if (!isValid)
                    // Text(errorMess, style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12)),
                    _buildError(errorMess)
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildError(String? errorText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0).copyWith(top: 8),
      child: Row(
        children: [
          GtdImage.svgFromSupplier(assetName: 'assets/icons/info-red.svg'),
          const SizedBox(width: 6),
          Text(
            errorText ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GtdInputMsc.errorStyle,
          ),
        ],
      ),
    );
  }
}
