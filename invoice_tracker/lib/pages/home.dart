import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/expense.dart';

import '../widgets/background.dart';
import '../widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);
    const String nombreUsuario = 'Ana';
    int currentBudget = 0;
    bool showBudget = false;
    
    List<Expense> expenses = [
      Expense(amount: 100, name: 'Food'),
      Expense(amount: 200, name: 'Transport'),
      Expense(amount: 300, name: 'Clothes'),
      Expense(amount: 400, name: 'Entertainment'),
      Expense(amount: 500, name: 'Other'),
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white10,
        child: Stack(
          children: <Widget>[
            const Background(),
           ListView(
                children: [
                 Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(8)),
                    child:Text(
                      'Welcome,\n $nombreUsuario!',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: responsive.dp(4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 ),  
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(3)),
                    child:Center(
                    child: TextButton(onPressed: () { showBudget = true; },
                      child: Text(
                      'Current Budget',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: responsive.dp(2.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),  
                    ),
                ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(1)),
                    child: Center(
                      child: Text(
                       (showBudget==true?'\$ $currentBudget':'\$ ......'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(6)),
                    child: Center(
                    child: SizedBox(
                      width: responsive.wp(90),
                      height: responsive.hp(6),
                      child:ElevatedButton(
                        onPressed: () { Navigator.pushNamed(context, '/register_expense'); },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0075a2)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          )
                        ),
                        child: const Text('Register Expense', style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ),
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(6)),
                    child: SizedBox(
                    height: responsive.hp(20),
                    width: responsive.wp(90),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(color: Color(0xff0075a2), width: 2),
                      ),
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5)),
                          child:ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: responsive.wp(0), bottom: responsive.wp(0)),
                                child:TextButton(onPressed: () { Navigator.pushNamed(context, '/historic_movements'); },
                                  child: Text(
                                    'Last Movements',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: const Color(0xff0075a2),
                                      fontSize: responsive.dp(2),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.grey                            
                                ),                          
                            ],
                        ),
                      )
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(4)),
                    child: SizedBox(
                    height: responsive.hp(12),
                    width: responsive.wp(90),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(color: Color(0xff0075a2), width: 2)
                      ),
                      color: const Color(0xff0075a2),
                      child: Padding(
                          padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(2.5)),
                          child:ListView(
                                children: <Widget>[
                                  Center(
                                    child:Text('Improve your financial situation',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: responsive.dp(1.8),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),  
                                  ),
                                  ElevatedButton(
                                    onPressed: () { Navigator.pushNamed(context, '/register_expense'); },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff8bc34a)),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                      )
                                    ),
                                    child: const Text('Get Saving Tips', style: TextStyle(fontWeight: FontWeight.bold),),
                                  )
                                ]
                          )
                      )
                    ),
                  ),
                ),
                
              ],
              ),
            const NavBar(),
          ],
        )
      ),
    );
  }

}

