import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/validator_service.dart';

class TitleFieldWidget extends StatelessWidget {
  const TitleFieldWidget({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const Text("Task title"),
        const SizedBox(height: 8),

        TextFormField(
          controller: titleController,
          validator: ValidatorService.validateTitle,
          decoration: InputDecoration(
            hintText: "Enter title here...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
