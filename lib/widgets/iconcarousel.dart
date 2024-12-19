import 'package:flutter/material.dart';

class Iconcarousel extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 50, // Altura fixa para o carrossel
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) { // para cada index, o construtor retorna um widget representando um item do carrossel.
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50), // Imagens arredondadas
                  child: Image.network(
                    imageUrls[index],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover // ajusta a imagem para preencher completamente o espaço
                  ),
                ),
              );
            }, // Item builder
          ),
        ),
      ),
    );
  }
}
