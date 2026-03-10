import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/features/home/data/models/task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  late Status selectedStatus;
  late Priority selectedPriority;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.task.title);
    contentController = TextEditingController(text: widget.task.content);

    selectedStatus = widget.task.status;
    selectedPriority = widget.task.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// Title
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Task Title"),
            ),

            const SizedBox(height: 20),

            /// Content
            TextField(
              controller: contentController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: "Task Description"),
            ),

            const SizedBox(height: 20),

            /// Status
            DropdownButtonFormField<Status>(
              value: selectedStatus,
              items: Status.values.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
              decoration: const InputDecoration(labelText: "Status"),
            ),

            const SizedBox(height: 20),

            /// Priority
            DropdownButtonFormField<Priority>(
              value: selectedPriority,
              items: Priority.values.map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPriority = value!;
                });
              },
              decoration: const InputDecoration(labelText: "Priority"),
            ),

            const Spacer(),

            /// Save Button
            ElevatedButton(
              onPressed: () async {
                widget.task.title = titleController.text;
                widget.task.content = contentController.text;
                widget.task.status = selectedStatus;
                widget.task.priority = selectedPriority;

                await widget.task.save();

                Navigator.pop(context);
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
