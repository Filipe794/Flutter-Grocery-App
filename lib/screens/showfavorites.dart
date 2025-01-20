import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
export 'package:groceryapp/screens/exportscreens.dart';

class ShowFavorites extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'imageurl':
          'https://drive.google.com/file/d/1y6EbgxTahJEjIc3V0tjfvlqUCePktCAs/view?usp=drive_link',
      'name': 'Sunflower Oil',
      'price': 5.00,
      'quantity': '1 L',
      'rating': '4.6 (150 Reviews)',
      'description':
          'High quality sunflower oil, ideal for cooking and frying with a neutral flavor.',
      'category': 'Oils',
      'productid': 'oils_001'
    }
  ];

  // todo -> adicionar consulta ao firebase

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
                      productData: favoriteItems[0],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
