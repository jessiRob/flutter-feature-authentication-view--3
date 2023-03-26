import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class Transaction extends StatelessWidget {

  final double value;
  final String name;
  final String paymentMethod;
  final String category;
  final String date;

  const Transaction ({Key? key, required this.value, required this.name, required this.paymentMethod, required this.category, required this.date}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(children: [
          Row(
            children: [
              if(value > 0) Icon(Icons.arrow_upward, color: const Color(0xff8bc34a), size: responsive.dp(2)),
              if (value <= 0) Icon(Icons.arrow_downward, color: const Color(0xffff2e2e), size: responsive.dp(2)),
              SizedBox(width: responsive.dp(1)),
              Expanded(child: Text(name, style: TextStyle(color: Colors.black87, fontSize: responsive.dp(2), fontWeight: FontWeight.w600)),),
              Expanded(child: Align(alignment: Alignment.centerRight, child: Text('\$ $value', style: TextStyle(color: (value>0?const Color(0xff8bc34a):const Color(0xffff2e2e)), fontSize: responsive.dp(1.7), fontWeight: FontWeight.w600))))
            ],
          ),
          SizedBox(height: responsive.dp(0.5)),
          Row(children: [
            SizedBox(width: responsive.dp(3)),
            Text(date, style: TextStyle(color: Colors.black45, fontSize: responsive.dp(1.4), fontWeight: FontWeight.w500)),
            SizedBox(width: responsive.dp(3)),
            Text(paymentMethod, style: TextStyle(color: Colors.black54, fontSize: responsive.dp(1.6), fontWeight: FontWeight.w500)),
          ],),
          SizedBox(height: responsive.dp(0.5)),
          Row(children: [
            SizedBox(width: responsive.dp(2)),
            Card(
              color: const Color(0xff0075a2),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.dp(1), vertical: responsive.dp(0.2)),
                child: Text(category, style: TextStyle(color: Colors.white, fontSize: responsive.dp(1.3), fontWeight: FontWeight.w500)),
              ),
            )
          ],),
        ],);
  }

}
