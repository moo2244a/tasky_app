import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneField extends StatelessWidget {
  final String label;
  final String initialCountryCode;
  final Function(String) onChanged;
  final TextEditingController? controller;
  const CustomPhoneField({
    super.key,
    this.label = 'رقم الهاتف',
    this.initialCountryCode = 'EG',
    required this.onChanged,
    this.controller,
    this.validator,
  });
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      initialCountryCode: initialCountryCode,
      onChanged: (phone) {
        onChanged(phone.completeNumber);
      },
    );
  }
}
