import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, required String hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
