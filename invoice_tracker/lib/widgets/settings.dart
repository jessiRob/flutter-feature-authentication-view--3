import 'package:flutter/material.dart';
import 'package:invoice_tracker/services/auth.dart';
import 'package:invoice_tracker/services/database.dart';
import 'package:uuid/uuid.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}
var uuid = const Uuid();
class _Settings extends State<Settings> {
  DateTime _date = DateTime.now();
  final AuthService _auth = AuthService();
  final DatabaseService _notifications = DatabaseService(uid: uuid.v4());
  final nameController = TextEditingController();
  @override
  void disposeName() {
    // Limpia el controlador cuando el Widget se descarte
    nameController.dispose();
    super.dispose();
  }
  final valueController = TextEditingController();
  @override
  void disposeValue() {
    // Limpia el controlador cuando el Widget se descarte
    valueController.dispose();
    super.dispose();
  }
  final maxValueController = TextEditingController();
  @override
  void disposeMaxValue() {
    // Limpia el controlador cuando el Widget se descarte
    maxValueController.dispose();
    super.dispose();
  }
  final referenceValueController = TextEditingController();
  @override
  void disposeReferenceValue() {
    // Limpia el controlador cuando el Widget se descarte
    referenceValueController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        thumbVisibility: true, //always show scrollbar
        thickness: 10, //width of scrollbar
        radius: const Radius.circular(20), //corner radius of scrollbar
        scrollbarOrientation: ScrollbarOrientation.left,
        child: ListView(
            children:<Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(16, 70, 16, 16),
                child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/user.png'),
                          radius: 70,
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                             Card(
                              margin: const EdgeInsets.fromLTRB(16, 0, 16, 7),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                              ),
                              child: ListTile(
                                title: Text(
                                    '    ${_auth.name}',
                                    style: const TextStyle(
                                        color: Colors.black
                                    )
                                ),
                              ),
                            ), Card(
                              margin: const EdgeInsets.fromLTRB(16, 7, 16, 7),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                              ),
                              child: ListTile(
                                  title: Text(
                                      '    ${_auth.email}',
                                      style: const TextStyle(
                                          color: Colors.black
                                      )
                                  )
                              ),
                            ),Card(
                              elevation: 10,
                              margin: const EdgeInsets.fromLTRB(16, 7, 16, 7),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: const Text('Change Password'),
                                          icon: IconButton(
                                            icon: const Icon(Icons.close),
                                            color: Colors.black,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          content: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Form(
                                              child: Column(
                                                children: <Widget>[
                                                  TextFormField(
                                                    decoration: const InputDecoration(
                                                      labelText: 'Old password',
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    decoration: const InputDecoration(
                                                      labelText: 'New password',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                child:const Text("Submit"),
                                                onPressed: () {}
                                            )
                                          ],
                                        );
                                      }
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: Colors.white,
                                ),
                                child: const ListTile(
                                  title: Text(
                                      'Change Password',
                                      style: TextStyle(
                                          color: Colors.black
                                      )
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 10,
                              margin: const EdgeInsets.fromLTRB(16, 7, 16, 7),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: const Text('Debt Notifications'),
                                          icon: IconButton(
                                            icon: const Icon(Icons.close),
                                            color: Colors.black,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          content: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Form(
                                              child: Column(
                                                children: <Widget>[
                                                  TextFormField(
                                                    controller: nameController,
                                                    decoration: const InputDecoration(
                                                        labelText: 'Name',
                                                        icon: Icon(Icons.person)
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: valueController,
                                                    decoration: const InputDecoration(
                                                        labelText: 'Value',
                                                        icon: Icon(Icons.attach_money)
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  ElevatedButton(
                                                      child:const Text("Select Date"),
                                                      onPressed: () {
                                                        showDatePicker(
                                                            context: context,
                                                            initialDate: _date,
                                                            firstDate: DateTime(2023),
                                                            lastDate: DateTime(2024)
                                                        ).then((newDate) =>
                                                            setState(() {
                                                              _date = newDate!;
                                                            })
                                                        );
                                                      }),
                                                  Text(
                                                    '${_date.year}/${_date.month}/${_date.day}',
                                                    style: const TextStyle(
                                                        fontSize: 25
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                child:const Text("Submit"),
                                                onPressed: () {
                                                  dynamic debt = _notifications.registerDebtNotification(_auth.userID, nameController.text, valueController.text, _date);
                                                  if (debt == null){
                                                    print('error');
                                                  } else {
                                                    Navigator.pop(context);
                                                  }
                                                }
                                            )
                                          ],
                                        );
                                      }
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: Colors.white,
                                ),
                                child: const ListTile(
                                  title: Text(
                                      'Debt notifications',
                                      style: TextStyle(
                                          color: Colors.black
                                      )
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ), Card(
                              elevation: 10,
                              margin: const EdgeInsets.fromLTRB(16, 7, 16, 7),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: const Text('Saving Notifications'),
                                          icon: IconButton(
                                            icon: const Icon(Icons.close),
                                            color: Colors.black,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          content: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Form(
                                              child: Column(
                                                children: <Widget>[
                                                  TextFormField(
                                                    controller: maxValueController,
                                                    decoration: const InputDecoration(
                                                        labelText: 'Maximum Value',
                                                        icon: Icon(Icons.attach_money)
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: referenceValueController,
                                                    decoration: const InputDecoration(
                                                        labelText: 'Reference Value',
                                                        icon: Icon(Icons.attach_money)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                child:const Text("Submit"),
                                                onPressed: () {
                                                  dynamic saving = _notifications.registerSavingNotification(_auth.userID , maxValueController.text, referenceValueController.text);
                                                  if (saving == null){
                                                    print('error');
                                                  } else {
                                                    Navigator.pop(context);
                                                  }
                                                }
                                            )
                                          ],
                                        );
                                      }
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: Colors.white,
                                ),
                                child: const ListTile(
                                  title: Text(
                                      'Saving notifications',
                                      style: TextStyle(
                                          color: Colors.black
                                      )
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ),

                          ]
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: const Color(0xFFA5BE00),
                          ),
                          onPressed: () async {
                            await _auth.signOut();
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, '/authentication');
                          },
                          child: const Text('Log out')),
                      const SizedBox(height: 56),
                    ]
                ),
              )
            ]
        )
    );
  }
}
