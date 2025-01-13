import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/favouritebutton.dart';
import 'package:groceryapp/widgets/addtocart.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  Map<String, dynamic> productData = {
    'image_path': 'lib/assets/peach.png',
    'name': 'Fresh Peach',
    'price': '\$8.00',
    'quantity': 'dozen',
    'rate': '4.0 (89 Reviews)',
    'description': 'Descubra o sabor autêntico das peras orgânicas, cultivadas com cuidado e respeito à natureza. Reconhecidas por sua doçura e suculência, essas peras são ideais para lanches, sobremesas ou para trazer um toque especial às suas saladas. Uma escolha saudável e deliciosa para quem valoriza qualidade e sustentabilidade.',
  };

  // Função para gerar estrelas dinamicamente
  List<Widget> buildStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(Icons.star, color: Colors.yellow, size: 16.0));
      } else {
        stars.add(const Icon(Icons.star, color: Colors.grey, size: 16.0));
      }
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    double rating = double.parse(productData['rate'].split(' ')[0]);

    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackButton(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(productData['image_path']),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                productData['price'],
                                style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
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
                            productData['name'],
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
                            productData['quantity'],
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ...buildStars(rating),
                          const SizedBox(width: 5),
                          Text(productData['rate']),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SizedBox(
                              width: 370,
                              child: Text(
                                productData['description'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            QuantityAndCartWidget(),
          ],
        ),
      ),
    );
  }
}
