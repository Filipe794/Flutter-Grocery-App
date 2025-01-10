import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/favouritebutton.dart';
import 'package:groceryapp/widgets/addtocart.dart';

class Productpage extends StatelessWidget {
  Productpage({super.key});

  double price = 8.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
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
                        Image.asset('lib/assets/peach.png'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '\$${price.toStringAsFixed(2)}',
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
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        Text(" 4.0 (89 Reviews)"),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: SizedBox(
                            width: 370,
                            child: Text(
                              "Descubra o sabor autêntico das peras orgânicas, cultivadas com cuidado e respeito à natureza. Reconhecidas por sua doçura e suculência, essas peras são ideais para lanches, sobremesas ou para trazer um toque especial às suas saladas. Uma escolha saudável e deliciosa para quem valoriza qualidade e sustentabilidade.",
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: QuantityAndCartWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
