import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';

import '../model/transactionModel.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../widgets/background.dart';
import '../widgets/nav_bar.dart';
import '../widgets/settings.dart';
import '../widgets/transaction.dart';

class HistoricMovements extends StatefulWidget {
  const HistoricMovements({super.key});

  @override
  _HistoricMovementsState createState() => _HistoricMovementsState();
}

class _HistoricMovementsState extends State<HistoricMovements> {

  final AuthService _auth = AuthService();
  final DatabaseService _databaseService = DatabaseService(uid: uuid.toString());
  
  List<TransactionModel> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final transactions = await _databaseService.getAllUserMovements(_auth.userID);
    setState(() {
      expenses = transactions;
    });
  }

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
                                    value: (expenses[i].value),
                                    name: (expenses[i].name),
                                    paymentMethod: (expenses[i].paymentMethod),
                                    category: (expenses[i].category),
                                    date: (expenses[i].date.toString())
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

