import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/validator_service.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.dateController,
    required this.onPressed,
  });

  final TextEditingController dateController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: dateController,
      validator: ValidatorService.validateTitle,
      decoration: InputDecoration(
        hintText: "choose due date...",
        suffixIcon: IconButton(
          icon: const Icon(Icons.date_range_outlined, color: Colors.tealAccent),
          onPressed: onPressed,
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
