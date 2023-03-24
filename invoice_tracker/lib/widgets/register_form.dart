import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _name = '', _email = '', _password = '';
  _submit() {
    final isOK = _formKey.currentState?.validate();
    if (isOK!) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          InputText(
            keyBoardType: TextInputType.text,
            label: "Name",
            onChanged: (text) {
              _name = text;
            },
            validator: (text) {
              if (text!.length <= 0) {
                return "Invalid name";
              }
              return null;
            },
          ),
          InputText(
            keyBoardType: TextInputType.emailAddress,
            label: "Uniandes e-mail",
            onChanged: (text) {
              _email = text;
            },
            validator: (text) {
              if (!text!.contains("@")) {
                return "Invalid email";
              }
              return null;
            },
          ),
          InputText(
            keyBoardType: TextInputType.visiblePassword,
            obscureText: true,
            label: "Password",
            onChanged: (text) {
              _password = text;
            },
            validator: (text) {
              return null;
            },
          ),
          InputText(
            keyBoardType: TextInputType.visiblePassword,
            obscureText: true,
            label: "Confirm Password",
            onChanged: (text) {},
            validator: (text) {
              if (text! != _password) {
                return "Passwords don't match";
              }
              return null;
            },
          ),
          SizedBox(
            height: responsive.hp(5),
          ),
          SizedBox(
            width: responsive.wp(60),
            child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
                    backgroundColor: Color(0xA5BE00).withOpacity(0.8)),
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _submit();
                }),
          ),
          SizedBox(
            height: responsive.hp(2),
          )
        ]),
      ),
    );
  }
}
