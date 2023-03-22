import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/circle.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    final Responsive responsive = Responsive.of(context);
    final double circlesSize = responsive.wp(35);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xEBF2FA),
        child: Stack(
          children: <Widget>[

            //Background

            Positioned( //center circle
                top: responsive.wp(60),
                left: -responsive.wp(20),
                child: Circle(
                  size: circlesSize,
                  color: Color(0xA5BE00).withOpacity(0.2)
                )),
            Positioned( //top cirlce
                top: -responsive.wp(5),
                right: -responsive.wp(20),
                child: Circle(
                    size: circlesSize,
                    color: Color(0x0075A2).withOpacity(0.2)
                )),
            Positioned( // bottom circle
                bottom: -responsive.wp(5),
                right: -responsive.wp(20),
                child: Circle(
                    size: circlesSize,
                    color: Color(0x0075A2).withOpacity(0.2)
                )),

            //Tittle

            Positioned(
                top: responsive.wp(10),
                left: responsive.wp(10),
                child: Text(
                  "User \nauthentication",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: responsive.dp(5),
                    fontFamily: 'OpenSans'
                  ),
                )),

            // User image

            Positioned(
                top: responsive.wp(40),
                right: responsive.wp(35),
                child: CircleAvatar(
                      backgroundImage: AssetImage('assets/UserAuth.png'),
                      radius: responsive.wp(15),
                    ))

            // Padding(
            //  padding: EdgeInsets.all(size.width *0.3),
            //  child: CircleAvatar(
            //    backgroundImage: AssetImage('assets/UserAuth.png'),
            //    radius: (size.width *0.2),
            //  ),
            //),


          ],
        ),
      ),
    );
  }
}