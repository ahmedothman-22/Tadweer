import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadweer/core/theme/app_colors/dark_app_colors.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';

class NumberOfTaskDoneOrLeft extends StatelessWidget {
  const NumberOfTaskDoneOrLeft({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
        border: Border.all(color: DarkAppColors.primary800),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.font14Regular.copyWith(
            color: DarkAppColors.primary800,
          ),
        ),
      ),
    );
  }
}
