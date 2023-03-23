import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/circle.dart';
import 'package:invoice_tracker/widgets/login_form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double circlesSize = responsive.wp(35);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Color(0xEBF2FA),
            child: Stack(
              children: <Widget>[
                //Background

                Positioned(
                    //center circle
                    top: responsive.wp(60),
                    left: -responsive.wp(20),
                    child: Circle(
                        size: circlesSize,
                        color: Color(0xA5BE00).withOpacity(0.2))),
                Positioned(
                    //top cirlce
                    top: -responsive.wp(5),
                    right: -responsive.wp(20),
                    child: Circle(
                        size: circlesSize,
                        color: Color(0x0075A2).withOpacity(0.2))),
                Positioned(
                    // bottom circle
                    bottom: -responsive.wp(5),
                    right: -responsive.wp(20),
                    child: Circle(
                        size: circlesSize,
                        color: Color(0x0075A2).withOpacity(0.2))),

                //Tittle

                Positioned(
                    top: responsive.hp(7.5),
                    left: responsive.wp(10),
                    child: Text(
                      "User \nauthentication",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0x011627).withOpacity(1),
                          fontSize: responsive.dp(5),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700),
                    )),

                // User image

                Positioned(
                    top: responsive.hp(25),
                    right: responsive.wp(35),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/user.png'),
                      radius: responsive.dp(8),
                    )),

                LoginForm()
                //Login Formm


              ],
            ),
          ),
        ),
      ),
    );
  }
}
