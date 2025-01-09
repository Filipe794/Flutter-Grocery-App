import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final Color? color;
  final double size; 

  const BackButton({
    super.key,
    this.color,
    this.size = 24.0, 
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: color ?? Colors.black, 
        size: size,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
