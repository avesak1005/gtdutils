import 'package:flutter/material.dart';
import 'package:gtd_utils/constants/app_const.dart';
import 'package:gtd_utils/data/configuration/gtd_app_config.dart';
import 'package:gtd_utils/data/network/network.dart';

abstract class BaseViewModel with ChangeNotifier {
  GtdAppSupplier supplier = AppConst.shared.appScheme.appSupplier;
  bool hasPayment = AppConst.shared.appScheme.hasPayment;
  bool shouldAutoUpdate = true;
  @override
  void dispose() {
    super.dispose();
    Logger.i("$runtimeType is denied");
  }
}

class CardViewModel extends BaseViewModel {
  double width;
  double height;
  CardViewModel({
    required this.width,
    required this.height,
  });
}
