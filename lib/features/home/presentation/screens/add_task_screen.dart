import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/core/service/navigator.dart';

import 'package:tasky_app/core/theme/app_assets.dart';

import 'package:tasky_app/core/widget/custom_elevated_button.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';
import 'package:tasky_app/features/home/data/models/task.dart';
import 'package:tasky_app/features/home/presentation/widgets/add_image_container.dart';
import 'package:tasky_app/features/home/presentation/widgets/date_picker_widget.dart';
import 'package:tasky_app/features/home/presentation/widgets/description_field_widget.dart';
import 'package:tasky_app/features/home/presentation/widgets/priority_dropdown_widget.dart';
import 'package:tasky_app/features/home/presentation/widgets/title_field_widget.dart';

class AddTaskScreen extends StatefulWidget {
  final User user;
  const AddTaskScreen({super.key, required this.user});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController dateController = TextEditingController();

  final TextEditingController titleController = TextEditingController();
  final CustomNavigator customNavigator = CustomNavigator();

  final TextEditingController descriptionController = TextEditingController();
  late DateTime? date;
  Priority? priority;
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isCheckPriority = true;
  bool checkPriority() {
    if (priority == null) {
      isCheckPriority = false;
    } else {
      isCheckPriority = true;
    }
    setState(() {});
    return isCheckPriority;
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(nameBoxTask);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new task"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Form(
        key: globalKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              /// Add Image
              AddImageContainer(),

              const SizedBox(height: 20),

              /// Title
              TitleFieldWidget(titleController: titleController),

              const SizedBox(height: 20),

              /// Description
              DescriptionFieldWidget(
                descriptionController: descriptionController,
              ),

              const SizedBox(height: 20),

              /// Priority
              Column(
                crossAxisAlignment: .start,
                children: [
                  const Text("Priority"),
                  const SizedBox(height: 8),

                  PriorityDropdownWidget(
                    priority: priority,
                    isCheckPriority: isCheckPriority,
                    onChanged: (value) {
                      priority = value;
                      setState(() {});
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Date
              const Text("Due date"),
              const SizedBox(height: 8),

              DatePickerWidget(
                dateController: dateController,
                onPressed: () async {
                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2050),
                  );
                  if (date != null) {
                    dateController.text =
                        '${date!.day}/${date!.month}/${date!.year}';
                  }
                },
              ),

              const SizedBox(height: 30),

              /// Button
              SizedBox(
                height: 70,
                child: CustomElevatedButton(
                  onPressed: () {
                    if (globalKey.currentState!.validate() & checkPriority()) {
                      box.add(
                        Task(
                          user: widget.user,
                          image: AppAssets.imageItem,
                          title: titleController.text,
                          content: descriptionController.text,
                          dateTime: date!,
                          status: Status.waiting,
                          priority: priority!,
                        ),
                      );
                      customNavigator.pop(context);
                    }
                  },
                  text: 'Add Task',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
