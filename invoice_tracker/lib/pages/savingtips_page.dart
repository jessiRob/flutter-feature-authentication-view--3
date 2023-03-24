import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:invoice_tracker/utils/responsive.dart';
import 'package:invoice_tracker/widgets/background.dart';

import '../widgets/nav_bar.dart';

class SavingTipsPage extends StatefulWidget {
  const SavingTipsPage({super.key});
  @override
  _SavingTipsPageState createState() => _SavingTipsPageState();
}

class _SavingTipsPageState extends State<SavingTipsPage> {
  List<String> _cardTexts = [
    "Este es un texto muy largo para ver como se vería si el texto es demasiado grande para esto",
    "Si",
    "NO",
    "Card 4",
    "Card 5",
    "Card 6",
    "Card 7",
    "Card 8",
    "Card 9",
    "Card 10"
  ];

  List<bool> _cardLikes = List.filled(10, false);


  @override
  Widget build(BuildContext context) {
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
                  itemCount: _cardTexts.length,
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
                                  _cardTexts.elementAt(index),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: responsive.dp(3),
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
                                        print(_cardTexts.elementAt(index));
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