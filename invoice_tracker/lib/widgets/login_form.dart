import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';

  _submit(){
    final isOK = _formKey.currentState?.validate();

    if (isOK!){
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
            keyBoardType: TextInputType.emailAddress,
            label: "Uniandes e-mail",
            onChanged: (text){_email = text;},
            validator: (text){
              if (!text!.contains("@")){
                return "Invalid email";
              }
              return null;
            },
          ),
          InputText(
            keyBoardType: TextInputType.visiblePassword,
            obscureText: true,
            label: "password",
            onChanged: (text){_password = text;},
            validator: (text){return null;},
          ),
          SizedBox(
            height: responsive.hp(4),
          ),
          Row(
            children: <Widget>[
              new GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Color(0xA5BE00).withOpacity(1),
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          Row(
            children: <Widget>[
              new GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  "Not registered?",
                  style: TextStyle(
                    color: Color(0xA5BE00).withOpacity(1),
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
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
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {_submit();}),
          ),
          SizedBox(
            height: responsive.hp(2),
          ),
          Text(
            "Login with fingerprint",
            style: TextStyle(color: Color(0x011627).withOpacity(1)),
          ),
          SizedBox(
            height: responsive.hp(3),
          ),
        ]),
      ),
    );
  }
}
