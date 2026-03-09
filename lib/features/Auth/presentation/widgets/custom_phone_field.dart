import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  final String label;
  final String initialCountryCode;
  final Function(String) onChanged;

  const CustomPhoneField({
    super.key,
    this.label = 'رقم الهاتف',
    this.initialCountryCode = 'EG',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
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
