import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';

import '../widgets/background.dart';
import '../widgets/income_expense_cards.dart';
import '../widgets/nav_bar.dart';
import '../widgets/transaction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String nombreUsuario = 'Ana';
  int currentBudget = 0;
  bool _showBudget = false;
  int amountSpentWeek = 0;
  int amountSpentMonth = 0;
  int numberOfTransactions = 0;
  int amountSaved = 0;

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
                    child:TextButton(onPressed: () { setState(() => _showBudget = !_showBudget); },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Current Budget',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: responsive.dp(2.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),  
                          const SizedBox(width: 5),
                          if(!_showBudget) (const Icon(Icons.remove_red_eye_outlined, color: Colors.black54)),
                          if(_showBudget) (const Icon(Icons.hide_source, color: Colors.black54))
                        ],
                      )
                  ),  
                ),
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(1)),
                    child: Center(
                      child: Text(
                       (_showBudget?'\$ $currentBudget':'\$ ......'),
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
                        onPressed: () { Navigator.pushNamed(context, '/register_new_movement'); },
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
                    height: responsive.hp(25),
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
                                  color: Color(0xff0075a2)                           
                                ),   
                              // Iterate over expenses list and create a new widget for each expense
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
                              Padding(
                                padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(3), bottom: responsive.wp(3)),
                                child: Center(
                                child: SizedBox(
                                  width: responsive.wp(90),
                                  height: responsive.hp(6),
                                  child:ElevatedButton(
                                    onPressed: () { Navigator.pushNamed(context, '/historic_movements'); },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0075a2)),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                      )
                                    ),
                                    child: const Text('See more', style: TextStyle(fontWeight: FontWeight.bold),),
                                  )
                                ),
                                ),
                            ),  
                            ],
                        ),
                      )
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(4)),
                  child:const IncomeExpenseCards(),
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
                                    onPressed: () { Navigator.pushNamed(context, '/saving_tips'); },
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
                Padding(
                    padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5), top: responsive.wp(4)),
                    child: SizedBox(
                    // height: responsive.hp(20),
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
                          child:Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: responsive.wp(3), bottom: responsive.wp(2)),
                                  child: Text(
                                    'Your BudG\'s Summary',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: const Color(0xff0075a2),
                                      fontSize: responsive.dp(2),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ),
                              const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xff0075a2)                           
                                ),
                              Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(2)),
                                child:Row(
                                  children: [
                                    Text('Amount spent last week: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.dp(1.8), decoration: TextDecoration.underline)),
                                    Text('\$ $amountSpentWeek',  style: TextStyle(fontSize: responsive.dp(1.8))),
                                  ],
                                )
                              ),
                              Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(2)),
                                child:Row(
                                  children: [
                                    Text('Amount spent last month: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.dp(1.8), decoration: TextDecoration.underline)),
                                    Text('\$ $amountSpentMonth',  style: TextStyle(fontSize: responsive.dp(1.8))),
                                  ],
                                )
                              ),
                              Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(2)),
                                child:Row(
                                  children: [
                                    Text('Transactions in the last month: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.dp(1.8), decoration: TextDecoration.underline)),
                                    Text('\$ $numberOfTransactions',  style: TextStyle(fontSize: responsive.dp(1.8))),
                                  ],
                                )
                              ),
                              Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(4)),
                                child:Row(
                                  children: [
                                    Text('Amount saved in the last month: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.dp(1.8), decoration: TextDecoration.underline)),
                                    Text('\$ $amountSaved',  style: TextStyle(fontSize: responsive.dp(1.8))),
                                  ],
                                )
                              )                                
                            ],
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.hp(13),
                )
              ],
              ),
            const NavBar(),
          ],
        )
      ),
    );
  }

}

