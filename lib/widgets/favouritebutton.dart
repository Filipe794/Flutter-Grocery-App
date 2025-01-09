import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final double size; // Controla o tamanho do botão
  final VoidCallback onTap; // Função a ser executada ao pressionar

  const FavoriteButton({
    super.key,
    this.size = 24.0, // Tamanho padrão
    required this.onTap,
  });

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();

    // Configurando o controlador de animação
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

    widget.onTap(); // Chama a função passada ao botão
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
