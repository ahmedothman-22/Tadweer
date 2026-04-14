import 'package:flutter/material.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/features/home/presentation/widgets/profile_list_tile.dart';

class ChangeAcountPassword extends StatefulWidget {
  const ChangeAcountPassword({super.key});

  @override
  State<ChangeAcountPassword> createState() => _ChangeAcountPasswordState();
}

class _ChangeAcountPasswordState extends State<ChangeAcountPassword> {
  @override
  Widget build(BuildContext context) {
    return ProfileListTile(
      title: 'Change Account Password',
      onPressed: showChangePasswordDialog,
      icon: Icons.lock_outline,
    );
  }

  void showChangePasswordDialog() {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Current Password',
                labelStyle: AppTextStyles.font16Regular.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: AppTextStyles.font12Regular.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(onPressed: () async {}, child: Text('Save')),
        ],
      ),
    );
  }
}
