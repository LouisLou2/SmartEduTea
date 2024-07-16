import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import '../../const/ui_param.dart';
import '../../style/app_colors.dart';

class ToastHelper {
  const ToastHelper._();

  static const Duration errorDuration=Duration(seconds: UIParams.defSnackBarDuration_error);
  static const Duration warningDuration=Duration(seconds: UIParams.defSnackBarDuration_warning);
  static const Duration successDuration=Duration(seconds: UIParams.defSnackBarDuration_success);

  static void showSuccess(String title){
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.simple,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: successDuration,
      backgroundColor: AppColors.successGreen,
      foregroundColor: Colors.white,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
    );
  }
  static void showWarningWithouDesc(String title){
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.simple,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: warningDuration,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
    );
  }
  static void showWarningWithDesc(String title,String desc){
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        desc,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: warningDuration,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      showProgressBar: false,
    );
  }
  static void showErrorWithouDesc(String title){
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.simple,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: errorDuration,
      primaryColor: AppColors.normalRed,
      backgroundColor: AppColors.normalRed,
      foregroundColor: Colors.white,
      boxShadow: lowModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
    );
  }
  static void showErrorWithDesc(String title,String desc){
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text(title,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        desc,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      boxShadow: lowModeShadow,
      autoCloseDuration: errorDuration,
      dragToClose: true,
      closeButtonShowType: CloseButtonShowType.none,
      showProgressBar: false,
    );
  }
}