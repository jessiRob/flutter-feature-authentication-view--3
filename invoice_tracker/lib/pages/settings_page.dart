import 'package:flutter/material.dart';
import 'package:invoice_tracker/widgets/settings.dart';

import '../utils/responsive.dart';
import '../widgets/background.dart';
import '../widgets/nav_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();

}
class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
                    width: double.infinity,
                    height: responsive.height,
                    child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: responsive.hp(7.5),
                              left: responsive.wp(10),
                              child: Text(
                                "Settings",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: const Color(0xFF011627).withOpacity(1),
                                    fontSize: responsive.dp(5),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700),
                              )),
                          const Background(),
                          Settings(),
                          const NavBar()]
            )
        )

        )


    );
  }
}