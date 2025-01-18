import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
export 'package:groceryapp/screens/exportscreens.dart';

class ShowFavorites extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'name': 'Fresh Broccoli',
      'price': 2.22,
      'category': 'Vegetable',
      'image': 'lib/assets/peach.png',
    },
    {
      'name': 'Black Grapes',
      'price': 2.22,
      'category': 'Fruits',
      'image': 'lib/assets/peach.png',
    },
    {
      'name': 'Avocado',
      'price': 2.22,
      'category': 'Fruits',
      'image': 'lib/assets/peach.png',
    },
    {
      'name': 'Pineapple',
      'price': 2.22,
      'category': 'Fruits',
      'image': 'lib/assets/peach.png',
    },
  ];

  ShowFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: const Text('Favoritos'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: favoriteItems.isEmpty
            ? const Center(
          child: Text(
            'Você ainda não tem produtos favoritados!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteItems[index];
              return FavoriteCard(
                path: item['image'],
                color: Colors.green,
                name: item['name'],
                productPrice: '\$${item['price'].toStringAsFixed(2)}',
                category: item['category'],
              );
            },
          ),
        ),
      ),
    );
  }
}