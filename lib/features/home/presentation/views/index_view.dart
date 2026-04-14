import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  File? _profileImage;
  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null && mounted) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Ahmed Othman',
            style: AppTextStyles.font18Bold.copyWith(
              color: textTheme.bodyLarge!.color,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 24.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(21.r),
                child: _profileImage != null
                    ? Image.file(
                        _profileImage!,
                        fit: BoxFit.cover,
                        width: 48.w,
                        height: 48.h,
                      )
                    : Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        width: 48.w,
                        height: 48.h,
                      ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/home_image.png'),
              SizedBox(height: 10.h),
              Text(
                'Welcome to Tadweer',
                style: AppTextStyles.font20Regular.copyWith(
                  color: textTheme.bodyLarge!.color,
                ),
              ),
              Text(
                'Your personal task manager',
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: textTheme.bodyMedium?.color?.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
