import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';

import '../widgets/background.dart';
import '../widgets/nav_bar.dart';

class RegisterExpense extends StatefulWidget {
  const RegisterExpense({super.key});

  @override
  _RegisterExpenseState createState() => _RegisterExpenseState();
}

class _RegisterExpenseState extends State<RegisterExpense> {

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
            Transform.translate(
              offset: Offset(0, -responsive.hp(6)),
              child: Center(
                child: SizedBox(
                  width: responsive.wp(80),
                  height: responsive.hp(6),
                  child:ElevatedButton(
                    onPressed: () { Navigator.pushNamed(context, '/'); },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      )
                    ),
                    child: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ),
                )
              ),
            const NavBar(),
          ],
        )
      ),
    );
  }

}

