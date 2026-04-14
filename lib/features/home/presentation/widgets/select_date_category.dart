import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/features/home/presentation/widgets/category_selector.dart';

class SelectDateandcategory extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final Function(String) onCategorySelected;

  const SelectDateandcategory({
    super.key,
    required this.onDateSelected,
    required this.onCategorySelected,
  });

  @override
  State<SelectDateandcategory> createState() => _SelectDateandcategoryState();
}

class _SelectDateandcategoryState extends State<SelectDateandcategory> {
  DateTime initialDate = DateTime.now();
  DateFormat formattedDate = DateFormat('dd-MM-yyyy');
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Select Date',
              style: AppTextStyles.font14Regular.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            TextButton(
              onPressed: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  builder: (context, child) => child!,
                );
                if (date != null) {
                  setState(() {
                    initialDate = date;
                    widget.onDateSelected(initialDate);
                  });
                }
              },
              child: Icon(Icons.alarm_outlined),
            ),
            Text(formattedDate.format(initialDate)),
          ],
        ),
        Column(
          children: [
            Text(
              'Select Category',
              style: AppTextStyles.font14Regular.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            TextButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  builder: (context) => CategorySelector(
                    onCategorySelected: (category) {
                      Navigator.pop(context, category);
                    },
                  ),
                );
                if (result != null) {
                  setState(() {
                    selectedCategory = result;
                    widget.onCategorySelected(selectedCategory);
                  });
                }
              },
              child: Icon(Icons.category_outlined),
            ),
            Text(selectedCategory),
          ],
        ),
      ],
    );
  }
}
