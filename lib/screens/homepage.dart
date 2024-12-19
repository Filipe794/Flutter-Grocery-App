import 'package:flutter/material.dart';
// import 'package:groceryapp/widgets/productcard.dart';
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

                ClickableRow(text: "Categories", onTap: () {}),
                SizedBox(height: 10),

                // Ícones do carousel
                SizedBox(
                  height: 100, // Altura fixa para o Iconcarousel
                  child: Iconcarousel(),
                ),
                // Ajuste de layout para evitar overflow
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // Ajusta o espaço entre os cartões
                        children: [
                          ProductCard(
                            imageUrl: 'lib/assets/peach.png',
                            productName: 'Fresh Peach',
                            productPrice: '\$8.00',
                            productQuantity: 'dozen',
                          ),
                          SizedBox(
                              height: 4), // Menor espaçamento entre os cartões
                          ProductCard(
                            imageUrl: 'lib/assets/apple.png',
                            productName: 'Fresh Apple',
                            productPrice: '\$5.00',
                            productQuantity: 'kg',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10), // Espaço entre as colunas
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // Ajusta o espaço entre os cartões
                        children: [
                          ProductCard(
                            imageUrl: 'lib/assets/peach.png',
                            productName: 'Fresh Peach',
                            productPrice: '\$8.00',
                            productQuantity: 'dozen',
                          ),
                          SizedBox(
                              height: 4), // Menor espaçamento entre os cartões
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

      // Footer com os ícones de navegação
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            default:
          }
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.shopping_bag_outlined),
      ),
    );
  }
}
