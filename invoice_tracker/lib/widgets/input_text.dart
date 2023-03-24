import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final void Function(String text)onChanged;
  final String? Function(String? text)validator;
  final String label;
  final TextInputType keyBoardType;
  final bool obscureText;

  const InputText(
      {Key? key,
      this.label = "",
      this.keyBoardType = TextInputType.text,
      this.obscureText = false,
      required this.onChanged,
        required this.validator,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyBoardType,
      obscureText: this.obscureText,
      onChanged: this.onChanged,
      validator: this.validator,
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(color: Color(0x011627).withOpacity(0.5))),

    );
  }
}
