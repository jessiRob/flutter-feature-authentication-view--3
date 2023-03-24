import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import '../widgets/background.dart';
import '../widgets/nav_bar.dart';
const List<String> list = <String>['Nequi', 'Davivienda', 'Cash', 'Bancolombia'];

class RegisterNewMovementPage extends StatefulWidget {
  const RegisterNewMovementPage({super.key});
  @override
  State<RegisterNewMovementPage> createState() => _RegisterNewMovementPage();

}

class _RegisterNewMovementPage extends State<RegisterNewMovementPage> {
  int defaultChoiceIndex = 0;
  List<IconData> _choicesIcon = [Icons.fastfood_rounded,Icons.airplanemode_active, Icons.person, Icons.money];
  List<String> _choicesList = ['Food', 'Travel', 'Clothes', 'Salary'];
  String dropdowncurrentvalue = list.first;
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child:
                SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    height: responsive.height,
                    child:

                    Stack(
                        children: <Widget>[
                          //Background
                          Positioned(
                              top: responsive.hp(7.5),
                              left: responsive.wp(10),
                              child: Text(
                                "Register new \nmovement",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: const Color(0xFF011627).withOpacity(1),
                                    fontSize: responsive.dp(5),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700),
                              )),
                          const Background(),
                          Container(
                                margin: const EdgeInsets.fromLTRB(16, 120, 16, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Enter the name of the movement'
                                      ),
                                      style:  TextStyle(
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    Card(
                                      margin: const EdgeInsets.all(16),
                                      shape: const RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white70, width: 1),
                                          borderRadius: BorderRadius.all(Radius.circular(8.0),)
                                      ),
                                      color: const Color(0xA60075A2),
                                      child: Column(
                                          children: <Widget>[
                                            const ListTile(
                                                title: Text(
                                                    ' Select Category',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                      fontFamily: 'OpenSans',
                                                    )
                                                )
                                            ),
                                            Wrap(
                                              alignment: WrapAlignment.spaceEvenly,
                                              spacing: 5,
                                              children: List.generate(_choicesList.length, (index) {
                                                return ChoiceChip(
                                                  avatar: Icon(_choicesIcon[index]),
                                                  labelPadding: const EdgeInsets.all(5),
                                                  label: Text(
                                                    _choicesList[index],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(color: Colors.black, fontSize: 16),
                                                  ),
                                                  selected: defaultChoiceIndex == index,
                                                  backgroundColor: Colors.white,
                                                  selectedColor: const Color(0xFFA5BE00),
                                                  onSelected: (value) {
                                                    setState(() {
                                                      defaultChoiceIndex = value ? index : defaultChoiceIndex;
                                                    });
                                                  },
                                                  // backgroundColor: color,
                                                  elevation: 1,
                                                  padding: const EdgeInsets.all(20),
                                                );
                                              }),
                                            ),
                                          ]
                                      ),
                                    ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: <Widget>[
                                         SizedBox(
                                           width: responsive.width*0.5,
                                           child: const TextField(
                                             decoration: InputDecoration(
                                               border: OutlineInputBorder(),
                                               labelText: 'Value of the movement',
                                             ),
                                             style: TextStyle(
                                               fontFamily: 'OpenSans',
                                             ),
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(10, 10, 40, 16),
                                           child:DropdownButton <String>(
                                             alignment: AlignmentDirectional.center,
                                             value: dropdowncurrentvalue,
                                             icon: const Icon(Icons.arrow_downward),
                                             iconSize: 15,
                                             elevation: 16,
                                             underline: Container(
                                               height: 3,
                                               color: const Color(0xFFA5BE00),
                                             ),
                                             style: const TextStyle(color: Color(0xFFA5BE00)),
                                             onChanged: (String? valueIn) {
                                               setState(() {
                                                 dropdowncurrentvalue = valueIn!;
                                               });
                                             },
                                             items: list.map<DropdownMenuItem<String>>((String value){
                                               return DropdownMenuItem<String>(
                                                 value:value,
                                                 child: Text(
                                                   value,
                                                   style: const TextStyle(
                                                     fontFamily: 'OpenSans',
                                                   ),
                                                 ),
                                               );
                                             }).toList(),
                                           ),
                                         ),
                                       ],
                                     ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          textStyle: const TextStyle(fontSize: 20),
                                          backgroundColor: const Color(0xFFA5BE00),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/historic_movements');
                                        },
                                        child: const Text(
                                            'Add new movement',
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                          ),
                                        )
                                    ),

                                  ],
                                ),
                              ),
                          const NavBar(),
                        ]
                    )
                )
                )
        )

    );
  }
}
