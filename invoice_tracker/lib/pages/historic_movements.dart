import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';

import '../widgets/background.dart';
import '../widgets/nav_bar.dart';
import '../widgets/transaction.dart';

class HistoricMovements extends StatefulWidget {
  const HistoricMovements({super.key});

  @override
  _HistoricMovementsState createState() => _HistoricMovementsState();
}

class _HistoricMovementsState extends State<HistoricMovements> {
  
    List expenses = [
      {'amount': -35000, 'name': 'Hamburger', 'cuenta': "Bancolombia", 'categoria': "food", "fecha": "Mar 23, 2023"},
      {'amount': -11000, 'name': 'Breakfast', 'cuenta': "Nequi", 'categoria': "Food", "fecha": "Mar 23, 2023"},
      {'amount': 100000, 'name': 'Tutoring', 'cuenta': "Bancolombia", 'categoria': "Work", "fecha": "Mar 22, 2023"},
      {'amount': -25000, 'name': 'Movie Tickets', 'cuenta': "Davivienda", 'categoria': "Entertainment", "fecha": "Mar 21, 2023"},
      {'amount': -150000, 'name': 'Shopping', 'cuenta': "Davivienda", 'categoria': "Retail", "fecha": "Mar 20, 2023"},
      {'amount': -50000, 'name': 'Gasoline', 'cuenta': "Bancolombia", 'categoria': "Transportation", "fecha": "Mar 19, 2023"},
      {'amount': 800000, 'name': 'Salary', 'cuenta': "Davivienda", 'categoria': "Work", "fecha": "Mar 18, 2023"}
  ];

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);

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
                    child:Center(
                      child:Text(
                      'Your transaction history',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: responsive.dp(4),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    )
                 ), 
                 Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(5)),
                    child:Center(
                      child:Text(
                      'Know how you use your money',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: responsive.dp(2),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    )
                 ), 
                Container(padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(5)),
                  color: Colors.white24,
                  child:Column(children: [
                    for(int i = 0; i < expenses.length; i++)
                                Container(
                                  padding: EdgeInsets.only(top: responsive.wp(1.5), bottom: responsive.wp(1.5)),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xff0075a2),
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  child: Transaction(
                                    amount: (expenses[i]['amount'] ?? 0),
                                    name: (expenses[i]['name'] ?? ""),
                                    cuenta: (expenses[i]['cuenta'] ?? ""),
                                    categoria: (expenses[i]['categoria'] ?? ""),
                                    fecha: (expenses[i]['fecha'] ?? ""),
                                  ),
                                ),  
              
                  ],)
                ),  
                SizedBox(height: responsive.wp(20))
              ],
            ),
            const NavBar(),
          ],
        )
      ),
    );
  }

}

