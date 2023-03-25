import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:invoice_tracker/controller/controller.dart';
import 'package:invoice_tracker/model/tips_model.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/background.dart';

import '../widgets/nav_bar.dart';

class SavingTipsPage extends StatefulWidget {
  const SavingTipsPage({super.key});
  @override
  _SavingTipsPageState createState() => _SavingTipsPageState();
}

class _SavingTipsPageState extends State<SavingTipsPage> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {

    List<Tip> _tips = controller.getTips();
    List<bool> _cardLikes = List.filled(_tips.length, false);

    final responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(responsive.dp(1)),
        child: Stack(
          children: <Widget>[
            //Background
             Background(),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(height: responsive.hp(7)),

                //Tittle
                Container(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
                  child: Text(
                    "Saving tips",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0x011627).withOpacity(1),
                        fontSize: responsive.dp(5),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: responsive.hp(10)),
                CarouselSlider.builder(
                  itemCount: _tips.length,
                  options: CarouselOptions(
                    height: responsive.hp(50),
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Padding(
                      padding: EdgeInsets.all(responsive.dp(1)),
                      child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(responsive.dp(2)),
                        ),
                        child: Container(
                          width: responsive.wp(80),
                          padding: EdgeInsets.all(responsive.dp(2.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  _tips.elementAt(index).tip,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: responsive.dp(2),
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: responsive.hp(7)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _cardLikes[index] ? "Liked!" : "Like",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: responsive.dp(2.5),
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _cardLikes[index]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _cardLikes[index] = !_cardLikes[index];
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const NavBar(),
          ]
        ),
      ),
    );
  }
}