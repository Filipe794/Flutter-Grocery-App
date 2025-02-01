import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final double size;
  final bool isFavorited;
  final VoidCallback onTap;

  const FavoriteButton({
    super.key,
    this.size = 24.0,
    required this.onTap,
    this.isFavorited = false,
  });

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late bool isFavorited;

  @override
  void initState() {
    super.initState();

    isFavorited = widget.isFavorited;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFavorite,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Icon(
          isFavorited ? Icons.favorite : Icons.favorite_border,
          color: isFavorited ? Colors.red : const Color.fromARGB(255, 1, 0, 0),
          size: widget.size,
        ),
      ),
    );
  }
}
