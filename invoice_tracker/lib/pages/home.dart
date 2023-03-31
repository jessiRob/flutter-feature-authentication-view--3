import 'package:flutter/material.dart';
import 'package:invoice_tracker/model/transactionModel.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:uuid/uuid.dart';

import '../services/auth.dart';
import '../services/database.dart';
import '../widgets/background.dart';
import '../widgets/income_expense_cards.dart';
import '../widgets/nav_bar.dart';
import '../widgets/transaction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

var uuid = const Uuid();

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  final DatabaseService _databaseService = DatabaseService(uid: uuid.toString());

  double currentBudget = 0;
  bool _showBudget = false;
  double amountSpentWeek = 0;
  double amountSpentMonth = 0;
  int numberOfTransactions = 0;
  double amountSaved = 0;
  double incomeAmount = 0;

  List<TransactionModel> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final transactions = await _databaseService.getLastUserMovements(_auth.userID);
    final lastMonthTransactions = await _databaseService.getLastMonthTransactions(_auth.userID);
    final budget = await _databaseService.getBudget(_auth.userID);
    
    setState(() {
      
      expenses = transactions;
      currentBudget = budget;

      double incomeAmountTemp = 0;
      double expensesAmountTemp = 0;
      double weekExpensesTemp = 0;

      for (int i = 0; i < lastMonthTransactions.length; i++) {
        double valorTransaccion = transactions[i].value;
        if (valorTransaccion > 0) {
          incomeAmountTemp += valorTransaccion;
        } else {
          expensesAmountTemp -= valorTransaccion;
          // Verify if  transactions[i].date is older than 7 days
          if(DateTime.now().difference(transactions[i].date).inDays < 8) {
            weekExpensesTemp -= valorTransaccion;
          }
        }
      }

      incomeAmount = incomeAmountTemp;
      amountSpentMonth = expensesAmountTemp;
      numberOfTransactions = lastMonthTransactions.length;
      amountSaved = incomeAmountTemp - expensesAmountTemp;
      amountSpentWeek = weekExpensesTemp;
      
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
                    child:Text(
                      'Welcome,\n ${_auth.name}!',
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
                                    value: (expenses[i].value),
                                    name: (expenses[i].name),
                                    paymentMethod: (expenses[i].paymentMethod),
                                    category: (expenses[i].category),
                                    date: (expenses[i].date.toString()),
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
                  child: IncomeExpenseCards(income: incomeAmount, expensesAmount: amountSpentMonth),
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
                                    Text('$numberOfTransactions',  style: TextStyle(fontSize: responsive.dp(1.8))),
                                  ],
                                )
                              ),
                              Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(4)),
                                child:Row(
                                  children: [
                                    Text('Saved in the last month: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.dp(1.8), decoration: TextDecoration.underline)),
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

