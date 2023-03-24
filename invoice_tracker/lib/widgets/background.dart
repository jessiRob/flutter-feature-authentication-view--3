import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/circle.dart';

class Background extends StatelessWidget{
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double circlesSize = responsive.wp(35);

    return Stack(
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
                  color: Color(0x0075A2).withOpacity(0.2)))

        ]);

  }


}
