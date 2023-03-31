import 'package:flutter/material.dart';
import 'package:invoice_tracker/utils/responsive.dart';

class IncomeExpenseCards extends StatelessWidget {

  final double income;
  final double expensesAmount;

  const IncomeExpenseCards({Key? key, required this.income, required this.expensesAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Row(
       children: [
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Color(0xff0075a2), width: 2),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: responsive.wp(3), right: responsive.wp(3), top: responsive.wp(2), bottom: responsive.wp(2)),
                  child: Column(
                    children: [
                     Row(
                        children: [
                          Text('Income', style: TextStyle(color: const Color(0xff0075a2), fontSize: responsive.dp(2), fontWeight: FontWeight.w600))
                        ],
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xff0075a2)                           
                      ),
                      Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(2)), child: Row(
                        children: [
                          // Add icon of up arrow
                          Icon(Icons.arrow_upward, color: const Color(0xff8bc34a), size: responsive.dp(2.5),),
                          Text(' \$ $income', style: TextStyle(color: const Color(0xff8bc34a), fontSize: responsive.dp(2), fontWeight: FontWeight.w600))
                        ],
                      ),),
                      SizedBox(
                        height: responsive.hp(2.2),
                        width: responsive.wp(80),
                        // Make the background green
                        child: Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Color(0xff8bc34a), width: 2),
                          ),
                          color: const Color(0xff8bc34a),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Color(0xff0075a2), width: 2),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: responsive.wp(3), right: responsive.wp(3), top: responsive.wp(2), bottom: responsive.wp(2)),
                    child: Column(
                      children: [
                      Row(
                          children: [
                            Text('Expenses', style: TextStyle(color: const Color(0xff0075a2), fontSize: responsive.dp(2), fontWeight: FontWeight.w600))
                          ],
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xff0075a2)                           
                        ),
                        Padding(padding: EdgeInsets.only(top: responsive.wp(2), bottom: responsive.wp(2)), child: Row(
                          children: [
                            // Add icon of up arrow
                            Icon(Icons.arrow_downward, color: const Color(0xffff2e2e), size: responsive.dp(2.5),),
                            Text(' \$ $expensesAmount', style: TextStyle(color: const Color(0xffff2e2e), fontSize: responsive.dp(2), fontWeight: FontWeight.w600))
                          ],
                        ),),
                        SizedBox(
                          height: responsive.hp(2.2),
                          width: responsive.wp(80),
                          // Make the background green
                          child: Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: Color(0xffff2e2e), width: 2),
                            ),
                            color: const Color(0xffff2e2e),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ),
        ],
    );
  }
}
