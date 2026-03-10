import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/validator_service.dart';

class DescriptionFieldWidget extends StatelessWidget {
  const DescriptionFieldWidget({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const Text("Task Description"),
        const SizedBox(height: 8),

        TextFormField(
          maxLines: 4,
          validator: ValidatorService.validateTitle,
          controller: descriptionController,
          decoration: InputDecoration(
            hintText: "Enter description here...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
