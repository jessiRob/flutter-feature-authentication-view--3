import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';

import '../widgets/background.dart';
import '../widgets/nav_bar.dart';

class HistoricMovements extends StatefulWidget {
  const HistoricMovements({super.key});

  @override
  _HistoricMovementsState createState() => _HistoricMovementsState();
}

class _HistoricMovementsState extends State<HistoricMovements> {

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);
    const String nombreUsuario = 'Ana';
    int currentBudget = 0;
    bool showBudget = false;


    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white10,
        child: Stack(
          children: <Widget>[
            const Background(),
            Positioned(
              top: responsive.hp(15),
              left: responsive.wp(8),
              child: Text(
                'Welcome,\n $nombreUsuario!',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: responsive.dp(4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const NavBar(),
          ],
        )
      ),
    );
  }

}

