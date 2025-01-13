import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/searchbar.dart';
import 'package:groceryapp/widgets/imagecarousel.dart';
import 'package:groceryapp/widgets/clickablerow.dart';
import 'package:groceryapp/widgets/iconcarousel.dart';
import 'package:groceryapp/widgets/productcard.dart';
import 'package:groceryapp/widgets/bottombar.dart';
import 'package:groceryapp/screens/showcategoriespage.dart';
import 'package:groceryapp/screens/shoppingcart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> iconData = [
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFFFE9E5),
      'name': 'Pineaple',
      'price': '\$8.00',
      'quantity': 'dozen',
    },
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFD2EFFF),
      'name': 'Apple',
      'price': '\$8.00',
      'quantity': 'dozen'
    },
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFD4C9EF),
      'name': 'Peach',
      'price': '\$8.00',
      'quantity': 'dozen'
    },
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFDCF4F5),
      'name': 'Avocado',
      'price': '\$8.00',
      'quantity': 'dozen'
    },
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFE6F2EA),
      'name': 'Dragon Fruit',
      'price': '\$8.00',
      'quantity': 'dozen'
    },
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFFFF6E3),
      'name': 'Pomegranate',
      'price': '\$8.00',
      'quantity': 'dozen'
    },
    {
      'path': 'lib/assets/peach.png',
      'color': Color(0xFFFFE8F2),
      'name': 'Orange',
      'price': '\$8.00',
      'quantity': 'dozen'
    },
  ];

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShowCategoriesPage()),
                    );
                  },
                ),
                SizedBox(height: 10),

                // Ícones de categorias
                SizedBox(
                  height: 75,
                  child: IconCarousel(),
                ),

                SizedBox(height: 10),

                // Produtos em duas colunas
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                  ),
                  itemCount: iconData.length,
                  itemBuilder: (context, index) {
                    final item = iconData[index];
                    return ProductCard(productQuantity: item['quantity'], productPrice: item['price'],path: item['path'], color: item['color'], name: item['name']);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onHomePressed: () {
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartPage() ));
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
