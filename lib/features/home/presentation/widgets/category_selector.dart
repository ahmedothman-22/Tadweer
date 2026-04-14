import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/core/widgets/custom_button.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key, required this.onCategorySelected});

  final Function(String) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Shopping',
        'icon': Icons.local_grocery_store,
        'color': Colors.greenAccent,
      },
      {'name': 'Work', 'icon': Icons.work, 'color': Colors.deepOrange},
      {
        'name': 'Sport',
        'icon': Icons.fitness_center,
        'color': Colors.cyanAccent,
      },
      {'name': 'Design', 'icon': Icons.design_services, 'color': Colors.teal},
      {'name': 'Study', 'icon': Icons.school, 'color': Colors.blue},
      {'name': 'Social', 'icon': Icons.campaign, 'color': Colors.pink},
      {'name': 'Music', 'icon': Icons.music_note, 'color': Colors.purpleAccent},
      {
        'name': 'Health',
        'icon': Icons.favorite,
        'color': Colors.lightGreenAccent,
      },
      {'name': 'Movies', 'icon': Icons.movie, 'color': Colors.lightBlue},
    ];

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Task Category',
                style: AppTextStyles.font18Regular.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              Divider(color: Colors.grey[200]),
              SizedBox(height: 20.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: categories.map((cat) {
                    return GestureDetector(
                      onTap: () {
                        onCategorySelected(cat['name']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: cat['color'],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(cat['icon'], color: Colors.black),
                            SizedBox(height: 8),
                            Text(
                              cat['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                width: MediaQuery.of(context).size.width * .5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
