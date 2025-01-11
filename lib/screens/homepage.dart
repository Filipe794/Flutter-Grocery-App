import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/searchbar.dart';
import 'package:groceryapp/widgets/imagecarousel.dart';
import 'package:groceryapp/widgets/clickablerow.dart';
import 'package:groceryapp/widgets/iconcarousel.dart';
import 'package:groceryapp/widgets/productcard.dart';
import 'package:groceryapp/widgets/bottombar.dart';

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
                // Barra de busca
                Search(),
                SizedBox(height: 10),

                // Carrossel de imagens
                SizedBox(
                  height: 200,
                  child: Carousel(),
                ),
                SizedBox(height: 10),

                // Linha clicável de categorias
                ClickableRow(
                  text: "Categories",
                  onTap: () {
                    // Direcionar para outra página
                    print("Categories clicked");
                  },
                ),
                SizedBox(height: 10),

                // Ícones de categorias
                SizedBox(
                  height: 75,
                  child: Iconcarousel(),
                ),

                SizedBox(height: 10),

                // Produtos em duas colunas
                Row(
                  children: [
                    Expanded(
                      child: Column(
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onHomePressed: () {
          print("Home button pressed");
        },
        onAccountPressed: () {
          print("Account button pressed");
        },
        onFavoritePressed: () {
          print("Favorite button pressed");
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          print("Floating Action Button pressed");
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
