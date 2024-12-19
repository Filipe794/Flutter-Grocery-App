import 'package:flutter/material.dart';

class ClickableRow extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // Função a ser chamada ao clicar

  const ClickableRow({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Chama a função ao clicar
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Espaçamento interno
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)), // Linha inferior
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaço entre os itens
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
