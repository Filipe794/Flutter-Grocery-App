import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onAccountPressed;
  final VoidCallback? onFavoritePressed;

  const CustomBottomAppBar({
    Key? key,
    this.onHomePressed,
    this.onAccountPressed,
    this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: onHomePressed,
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: onAccountPressed,
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: onFavoritePressed,
          ),
        ],
      ),
    );
  }
}

