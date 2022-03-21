import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscureText;
  const CustomTextfieldWidget(
      {Key? key,
      required this.onChanged,
      required this.label,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label),
      ),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
