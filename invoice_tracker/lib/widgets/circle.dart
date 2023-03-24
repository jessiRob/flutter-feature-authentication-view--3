import 'package:flutter/material.dart';

class Circle extends StatelessWidget{
  final double size;
  final Color color;

  Circle({Key? key,
    required this.size,
    required this.color,
  }) : assert(size>0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.color
      ),
    );
    throw UnimplementedError();
  }


}

