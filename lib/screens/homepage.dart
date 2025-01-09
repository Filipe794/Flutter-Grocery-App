import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/searchbar.dart';
import 'package:groceryapp/widgets/imagecarousel.dart';
import 'package:groceryapp/widgets/clickablerow.dart';
import 'package:groceryapp/widgets/iconcarousel.dart';
import 'package:groceryapp/widgets/productcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // barra de busca
                Search(),
                SizedBox(height: 10),

                // carrosel de imagens
                SizedBox(
                  height: 200,
                  child: Carousel(),
                ),
                SizedBox(height: 10),

                ClickableRow(
                    text: "Categories",
                    onTap: () {
                      // direcionar para outra página
                    }),
                SizedBox(height: 10),

                SizedBox(
                  height: 75, // Altura fixa para o Iconcarousel
                  child: Iconcarousel(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .max, // Ajusta o espaço entre os cartões
                        children: [
                          ProductCard(
                            imageUrl: 'lib/assets/peach.png',
                            productName: 'Fresh Peach',
                            productPrice: '\$8.00',
                            productQuantity: 'dozen',
                          ),
                          ProductCard(
                            imageUrl: 'lib/assets/apple.png',
                            productName: 'Fresh Apple',
                            productPrice: '\$5.00',
                            productQuantity: 'kg',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .max, // Ajusta o espaço entre os cartões
                        children: [
                          ProductCard(
                            imageUrl: 'lib/assets/peach.png',
                            productName: 'Fresh Peach',
                            productPrice: '\$8.00',
                            productQuantity: 'dozen',
                          ),
                          // SizedBox(
                          //     height: 4), // Menor espaçamento entre os cartões
                          ProductCard(
                            imageUrl: 'lib/assets/apple.png',
                            productName: 'Fresh Apple',
                            productPrice: '\$5.00',
                            productQuantity: 'kg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // BottomAppBar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Define o espaço para o FAB
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 24.0,
              icon: Icon(Icons.home),
              onPressed: () {
                // ação para o botão Home
              },
            ),
            IconButton(
              iconSize: 24.0,
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // ação para o botão Account
              },
            ),
            IconButton(
              iconSize: 24.0,
              icon: Icon(Icons.favorite),
              onPressed: () {
                // ação para o botão Favorite
              },
            ),
          ],
        ),
      ),

      // FloatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.shopping_bag_outlined),
      ),
    );
  }
}
