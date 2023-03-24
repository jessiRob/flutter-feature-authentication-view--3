import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(children: <Widget>[
        InputText(
          keyBoardType: TextInputType.text,
          label: "Name",
        ),
        InputText(
          keyBoardType: TextInputType.emailAddress,
          label: "Uniandes e-mail",
        ),
        InputText(
          keyBoardType: TextInputType.visiblePassword,
          obscureText: true,
          label: "Password",
        ),
        InputText(
          keyBoardType: TextInputType.visiblePassword,
          obscureText: true,
          label: "Confirm Password",
        ),

        SizedBox(
          height: responsive.hp(5),
        ),
        SizedBox(
          width: responsive.wp(60),
          child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: responsive.hp(2)),
                  backgroundColor: Color(0xA5BE00).withOpacity(0.8)),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {Navigator.pushNamed(context, '/');}),
        ),
        SizedBox(
          height: responsive.hp(2),
        )
      ]),
    );
  }
}
