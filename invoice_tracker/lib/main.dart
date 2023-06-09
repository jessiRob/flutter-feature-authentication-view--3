import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_tracker/pages/auth_page.dart';
import 'package:invoice_tracker/pages/historic_movements.dart';
import 'package:invoice_tracker/pages/home.dart';
import 'package:invoice_tracker/pages/register_new_movement_page.dart';
import 'package:invoice_tracker/pages/register_page.dart';
import 'package:invoice_tracker/pages/savingtips_page.dart';
import 'package:invoice_tracker/pages/settings_page.dart';
import 'package:invoice_tracker/pages/wrapper.dart';
import 'package:invoice_tracker/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //To remove rotation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
        title: 'BudG',
        theme: ThemeData(
          primarySwatch: Colors.lime,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/wrapper',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const Home(),
          '/wrapper': (BuildContext context) => const Wrapper(),
          '/register': (BuildContext context) => const RegisterPage(),
          '/authentication': (BuildContext context) => const AuthPage(),
          '/register_new_movement': (BuildContext context) => const RegisterNewMovementPage(),
          '/historic_movements': (BuildContext context) => const HistoricMovements(),
          '/user': (BuildContext context) => const SettingsPage(),
          '/saving_tips': (BuildContext context) => const SavingTipsPage(),
        },
    );
  }
}
