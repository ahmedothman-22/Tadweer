import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tadweer/core/routing/routes.dart';
import 'package:tadweer/core/theme/app_colors/dark_app_colors.dart';
import 'package:tadweer/core/theme/app_texts/app_text_styles.dart';
import 'package:tadweer/features/home/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    DateFormat formattedDate = DateFormat('dd-MM-yyyy');

    return Card(
      shadowColor: Colors.grey.shade300,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: Colors.grey.shade100,
      child: Slidable(
        key: ValueKey(taskModel.id),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: .5,
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete Task'),
                      content: Text(
                        'Are you sure you want to delete this task?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12.r),
              ),
            ),
            SlidableAction(
              onPressed: (context) async {
                GoRouter.of(context).push(Routes.taskediting, extra: taskModel);
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit_outlined,
              label: 'Edit',
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: Center(
            child: Row(
              children: [
                Container(
                  height: 75.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: DarkAppColors.primary800,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.name,
                      style: AppTextStyles.font14Regular.copyWith(
                        color: const Color.fromARGB(255, 41, 38, 38),
                      ),
                    ),
                    Text(
                      taskModel.details,
                      style: AppTextStyles.font14Regular.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.category, size: 18),
                        SizedBox(width: 5.w),
                        Text(
                          taskModel.category,
                          style: AppTextStyles.font14Regular.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: taskModel.isDone
                          ? Container(
                              height: 35.h,
                              width: 60.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Done',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: DarkAppColors.primary800,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                height: 35.h,
                                width: 60.w,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Icon(Icons.alarm, size: 18.sp),
                        SizedBox(width: 5.w),
                        Text(
                          formattedDate.format(taskModel.date),
                          style: AppTextStyles.font14Regular.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
