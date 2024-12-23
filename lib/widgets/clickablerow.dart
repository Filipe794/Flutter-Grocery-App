import 'package:flutter/material.dart';

class ClickableRow extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // Função a ser chamada ao clicar

  const ClickableRow({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.arrow_forward_ios, // Símbolo de seta
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
