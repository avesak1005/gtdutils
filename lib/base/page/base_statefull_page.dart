import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_utils/base/view_model/base_page_view_model.dart';
import 'package:gtd_utils/utils/popup/gtd_app_loading.dart';
import 'package:meta/meta.dart';

class BaseStatefulPage<T extends BasePageViewModel> extends StatefulWidget {
  final T viewModel;
  const BaseStatefulPage({super.key, required this.viewModel});

  @override
  State<BaseStatefulPage> createState() => _BaseStatefulPageState();
}

class _BaseStatefulPageState extends State<BaseStatefulPage> {
  @protected
  List<Widget> buildTrailingActions(BuildContext pageContext) {
    return [];
  }

  @protected
  Widget? titleWidget() {
    return null;
  }

  @protected
  AppBar? buildAppbar(BuildContext pageContext) {
    return AppBar(
      scrolledUnderElevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      elevation: 0,
      backgroundColor: Colors.white,
      title: ValueListenableBuilder(
        valueListenable: widget.viewModel.subTitleNotifer,
        builder: (context, value, child) {
          return titleWidget() != null
              ? titleWidget()!
              : Column(
                  children: [
                    (widget.viewModel.title != null)
                        ? Text(
                            widget.viewModel.title!,
                            style: const TextStyle(fontSize: 17),
                          )
                        : const SizedBox(),
                    (widget.viewModel.subTitle != null)
                        ? Text(
                            value,
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                          )
                        : const SizedBox(),
                  ],
                );
        },
      ),
    );
  }

  @mustBeOverridden
  Widget buildBody(BuildContext pageContext) {
    throw UnimplementedError();
  }

  @protected
  Widget? buildBottomBar(BuildContext pageContext) {
    return null;
  }

  @protected
  void popScope(BuildContext pageContext) {}

  @protected
  List<BlocProvider> initProviders() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        popScope(context);
        widget.viewModel.dispose();
      },
      child: GtdAppLoading(
        child: MultiBlocProvider(
          providers: initProviders(),
          child: Scaffold(
            backgroundColor: widget.viewModel.backgroundColor,
            extendBodyBehindAppBar: widget.viewModel.extendBodyBehindAppBar,
            appBar: buildAppbar(context),
            body: buildBody(context),
            bottomNavigationBar: buildBottomBar(context),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
}
