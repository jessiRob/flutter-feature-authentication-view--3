import 'package:flutter/material.dart';
import 'package:invoice_tracker/pages/auth_page.dart';
import 'package:invoice_tracker/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:invoice_tracker/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final User? user = _auth.signIn();
    print(user);

    if ( user == null){
      return AuthPage();
    } else  {
      return Home();
    }
    return AuthPage();
  }
}


