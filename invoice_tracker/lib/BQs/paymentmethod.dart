import 'package:flutter/material.dart';
import 'package:invoice_tracker/services/database.dart';
import 'package:uuid/uuid.dart';


var uuid = const Uuid();
class PaymentmethodsType4 extends StatefulWidget {
  const PaymentmethodsType4({super.key});

  @override
  _PaymentmethodsType4 createState() => _PaymentmethodsType4();
}

class _PaymentmethodsType4 extends State<PaymentmethodsType4> {

  final DatabaseService _databaseService = DatabaseService(uid: uuid.toString());
  Map<String, int> allpaymentmethods = {};
  int maxValue = 0;
  String pm = '';
   @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {

    final transactions = await _databaseService.getAllUsersMovements();
    final lastMonthTransactions = await _databaseService.getAllLastMonthTransactions();
    setState(() {
      

      for (int i = 0; i < lastMonthTransactions.length; i++) {
        String paymentmethod = transactions[i].paymentMethod;
        if (allpaymentmethods.containsKey(paymentmethod)) {
          int values = allpaymentmethods[paymentmethod]!+1;
          allpaymentmethods.update(paymentmethod, (value) => values);
          if (allpaymentmethods[paymentmethod]!> maxValue){
            maxValue=allpaymentmethods[paymentmethod]!;
            pm=paymentmethod;
          }
        } else {
          allpaymentmethods.addAll({paymentmethod: 1 });
        }
      }
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
          children: <Widget>[
            Text('$pm : '),
            Text('$maxValue')
          ],
        );
      } 
  }
