import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/');
      } else if (_selectedIndex == 1){
        Navigator.pushNamed(context, '/saving_tips');}
      else if (_selectedIndex == 2){
        Navigator.pushNamed(context, '/register_new_movement');}
      else if (_selectedIndex == 3){
        Navigator.pushNamed(context, '/historic_movements');}
      else if (_selectedIndex == 4){
        Navigator.pushNamed(context, '/user');}
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final currentRoute = ModalRoute.of(context)?.settings.name;

    if (currentRoute == '/') {
      _selectedIndex = 0;
    } else if (currentRoute == '/saving_tips') {
      _selectedIndex = 1;
    } else if (currentRoute == '/register_new_movement') {
      _selectedIndex = 2;
    } else if (currentRoute == '/historic_movements') {
      _selectedIndex = 3;
    } else if (currentRoute == '/user') {
      _selectedIndex = 4;
    }

    return Positioned(
      bottom: responsive.hp(1),
      left: responsive.wp(5),
      child: SizedBox(
        height: responsive.hp(8),
        width: responsive.wp(90),
        child: Card (
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: _selectedIndex == 0 ? const Color(0xFFA5BE00): Colors.grey),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.lightbulb, color: _selectedIndex == 1 ? const Color(0xFFA5BE00) : Colors.grey),
                onPressed: () => _onItemTapped(1),
              ),
              Container(
                decoration: BoxDecoration(
                  color:  const Color(0xFFA5BE00),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: _selectedIndex == 2 ? Colors.white : Colors.black45),
                  onPressed: () => _onItemTapped(2),
                ),
              ),
              IconButton(
                icon: Icon(Icons.library_books, color: _selectedIndex == 3 ? const Color(0xFFA5BE00) : Colors.grey),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: Icon(Icons.person, color: _selectedIndex == 4 ? const Color(0xFFA5BE00) : Colors.grey),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        )
      ),
    );
  }
}