import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/features/home/presentation/widgets/profile_list_tile.dart';

class ChangeAcountName extends StatefulWidget {
  const ChangeAcountName({super.key});

  @override
  State<ChangeAcountName> createState() => _ChangeAcountNameState();
}

class _ChangeAcountNameState extends State<ChangeAcountName> {
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return ProfileListTile(
      title: 'Change Account Name',
      onPressed: showChangeNameDialog,
      icon: Icons.person_outlined,
    );
  }

  void showChangeNameDialog() {
    final firstNameController = TextEditingController(text: firstName);
    final lastNameController = TextEditingController(text: lastName);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(
          'Change Account Name',
          style: AppTextStyles.font16Regular.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'Ahmed'),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Othman'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final newFirstName = firstNameController.text.trim();
              final newLastName = lastNameController.text.trim();

              if (newFirstName.isNotEmpty && newLastName.isNotEmpty) {
                if (!mounted) return;
                setState(() {
                  firstName = newFirstName;
                  lastName = newLastName;
                });

                Navigator.of(dialogContext).pop();
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
