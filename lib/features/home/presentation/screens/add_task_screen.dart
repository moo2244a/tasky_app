import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_button_style.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new task"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            /// Add Image
            Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Add Img",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Title
            const Text("Task title"),
            const SizedBox(height: 8),

            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter title here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Description
            const Text("Task Description"),
            const SizedBox(height: 8),

            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter description here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Priority
            const Text("Priority"),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: "Medium Priority",
                  items: const [
                    DropdownMenuItem(
                      value: "Low Priority",
                      child: Text("Low Priority"),
                    ),
                    DropdownMenuItem(
                      value: "Medium Priority",
                      child: Text("Medium Priority"),
                    ),
                    DropdownMenuItem(
                      value: "High Priority",
                      child: Text("High Priority"),
                    ),
                  ],
                  onChanged: (value) {},
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Date
            const Text("Due date"),
            const SizedBox(height: 8),

            TextFormField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                hintText: "choose due date...",
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.date_range_outlined,
                    color: Colors.tealAccent,
                  ),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2050),
                    );
                    if (date != null) {
                      dateController.text =
                          '${date.day}/${date.month}/${date.year}';
                    }
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: AppButtonStyle.elevatedButtonStyleFrom(
                  verticalPadding: 20,

                  backgroundColor: AppColors.splashBlue,
                  foregroundColor: AppColors.kWhite,
                ),
                child: Text(
                  "Add Task",
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
