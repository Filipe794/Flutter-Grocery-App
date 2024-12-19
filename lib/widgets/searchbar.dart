import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Buscar...',
          hintText: 'Digite o nome do produto',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1)
        ),
      ),
    );
  }
}
