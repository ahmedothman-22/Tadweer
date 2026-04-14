import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tadweer/core/theme/app_colors/dark_app_colors.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/features/home/models/task_model.dart';
import 'package:tadweer/features/home/presentation/widgets/custom_scaffold_bg.dart';
import 'package:tadweer/features/home/presentation/widgets/task_card.dart';

class CalanderView extends StatefulWidget {
  const CalanderView({super.key});

  @override
  State<CalanderView> createState() => _CalanderViewState();
}

class _CalanderViewState extends State<CalanderView> {
  final EasyDatePickerController controller = EasyDatePickerController();

  DateTime selectedDate = DateTime.now();
  List<TaskModel> allTasks = [
    TaskModel(
      name: "Study Flutter",
      details: "Revise state management",
      date: DateTime.now(),
      category: "Study",
      isDone: false,
    ),
    TaskModel(
      name: "Go Gym",
      details: "Leg day",
      date: DateTime.now(),
      category: "Health",
      isDone: true,
    ),
    TaskModel(
      name: "Meeting",
      details: "Project discussion",
      date: DateTime.now().add(Duration(days: 1)),
      category: "Work",
      isDone: false,
    ),
  ];

  List<TaskModel> get tasks {
    return allTasks
        .where(
          (task) =>
              task.date.year == selectedDate.year &&
              task.date.month == selectedDate.month &&
              task.date.day == selectedDate.day,
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBg(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: DarkAppColors.primary800,
        title: Text(
          'Calendar',
          style: AppTextStyles.font18SemiBold.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          EasyDateTimeLinePicker.itemBuilder(
            controller: controller,
            firstDate: DateTime(2025, 1, 1),
            currentDate: DateTime.now(),
            lastDate: DateTime(2030, 3, 18),
            focusedDate: selectedDate,
            itemExtent: 70.0.sp,
            itemBuilder:
                (context, date, isSelected, isDisabled, isToday, onTap) {
                  return InkResponse(
                    onTap: onTap,
                    child: Container(
                      width: 35.0.w,
                      height: 45.0.h,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? DarkAppColors.primary800
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isSelected
                              ? DarkAppColors.primary800
                              : Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        spacing: 8.0.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat.MMM().format(date),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            DateFormat.E().format(date),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
            onDateChange: (newDate) {},
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: tasks.isEmpty
                ? Column(
                    spacing: 5.h,
                    children: [
                      SizedBox(height: 40.h),
                      Image.asset(
                        'assets/images/checklist.png',
                        height: 80.h,
                        width: 80.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'No tasks for this day',
                        style: AppTextStyles.font18Regular.copyWith(
                          color: DarkAppColors.primary800,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Let\'s add some tasks to stay organized!',
                        style: AppTextStyles.font16Regular.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(taskModel: tasks[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
