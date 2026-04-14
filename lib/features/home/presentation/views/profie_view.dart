import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tadweer/core/routing/routes.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/features/home/presentation/widgets/change_acount_image.dart';
import 'package:tadweer/features/home/presentation/widgets/change_acount_name.dart';
import 'package:tadweer/features/home/presentation/widgets/change_acount_password.dart';
import 'package:tadweer/features/home/presentation/widgets/log_out.dart';
import 'package:tadweer/features/home/presentation/widgets/number_of_task_done_or_left.dart';
import 'package:tadweer/features/home/presentation/widgets/profile_list_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final String accountName = "Ahmed Othman";
    final String? imagePath = null;

    final List<Map<String, dynamic>> tasks = [
      {"title": "Task 1", "isDone": true},
      {"title": "Task 2", "isDone": false},
      {"title": "Task 3", "isDone": true},
    ];
    final doneTasks = tasks.where((task) => task["isDone"] == true).length;
    final notDoneTasks = tasks.where((task) => task["isDone"] == false).length;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 16.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Profile',
                style: AppTextStyles.font24Regular.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    imagePath != null && File(imagePath).existsSync()
                    ? FileImage(File(imagePath))
                    : AssetImage('assets/images/profile.jpg') as ImageProvider,
              ),

              Text(
                accountName.isNotEmpty ? accountName : 'No Name Set',
                style: AppTextStyles.font16Regular.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberOfTaskDoneOrLeft(text: '$notDoneTasks Tasks Left'),
                  NumberOfTaskDoneOrLeft(text: '$doneTasks Tasks Done'),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: .5,
                endIndent: 15.h,
                indent: 15.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Settings',
                    style: AppTextStyles.font16Regular.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ProfileListTile(
                    title: 'Settings',
                    onPressed: () {
                      GoRouter.of(context).push(Routes.appSetting);
                    },
                    icon: Icons.settings,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: .5,
                    endIndent: 15.h,
                    indent: 15.h,
                  ),
                  Text(
                    'Account',
                    style: AppTextStyles.font24Regular.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ChangeAcountName(),
                  ChangeAcountPassword(),
                  ChangeAcountImage(),
                  Divider(
                    color: Colors.grey,
                    thickness: .5,
                    endIndent: 15.h,
                    indent: 15.h,
                  ),
                  LogOut(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
