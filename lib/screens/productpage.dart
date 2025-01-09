// tela para exibir um produto
// row com imagem
// row com preço e icone dos favoritos
// row com nome do produto
// row com quantidade
// row com avaliação
// row com descrição
// row para botão de quantidade
// row com botão de adicionar ao carrinho

import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/favouritebutton.dart';

class Productpage extends StatelessWidget {
  Productpage({super.key});

  double price = 8.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // row com avaliação
                // row com descrição
                // row para botão de quantidade
                // row com botão de adicionar ao carrinho
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset('lib/assets/peach.png'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 16,
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        FavoriteButton(
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Fresh Peach',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'dozen',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Text(
                        'Fresh peaches are perfect for a summer day',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ) ,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Add to cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
