import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadweer/core/theme/app_colors/dark_app_colors.dart';

class SnackbarHelper {
  static void showSuccessSnackbar(
    String message,
    BuildContext context, {
    VoidCallback? onDismissed,
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: DarkAppColors.grey800)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      backgroundColor: DarkAppColors.primary800,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((_) {
      if (onDismissed != null) {
        onDismissed();
      }
    });
  }

  static void showErrorSnackbar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: DarkAppColors.grey0)),
      backgroundColor: DarkAppColors.error900,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500.r)),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
