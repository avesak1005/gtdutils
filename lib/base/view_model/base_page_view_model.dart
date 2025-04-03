import 'package:flutter/material.dart';
import 'package:gtd_utils/base/view_model/base_view_model.dart';

class BasePageViewModel extends BaseViewModel {
  late String? title;
  late String? subTitle;
  Color? backgroundColor;
  Color? appBarColor;
  Color? titleColor;
  bool extendBodyBehindAppBar = false;
  bool automaticallyImplyLeading = true;
  final ValueNotifier<String> subTitleNotifer = ValueNotifier("");
  ValueNotifier<UniqueKey> refershNotifier = ValueNotifier<UniqueKey>(UniqueKey());
  UniqueKey refreshSessionKey = UniqueKey();

  BasePageViewModel({this.title, this.subTitle, this.backgroundColor}) {
    subTitleNotifer.value = subTitle ?? "";
  }

  void resetPage() {
    UniqueKey newSessionKey = UniqueKey();
    refershNotifier.value = newSessionKey;
  }

  @override
  void dispose() {
    // refershNotifier.dispose();
    super.dispose();
  }
}
