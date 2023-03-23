import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyBoardType;
  final bool obscureText;

  const InputText(
      {Key? key,
      this.label = "",
      this.keyBoardType = TextInputType.text,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyBoardType,
      obscureText: this.obscureText,
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(color: Color(0x011627).withOpacity(0.5))),

    );
  }
}
