import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/favouritebutton.dart';
import 'package:add_to_cart_button/add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;
  final String productQuantity;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.95,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              FavoriteButton(onTap: () {}),
            ]),
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
            Column(
              children: [
                Text(
                  productPrice,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  productQuantity,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.5,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Icon(Icons.shopping_bag_outlined),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0, top: 5.0),
                      child: Column(
                        children: [
                          AddToCartCounterButton(
                            initNumber: 0,
                            minNumber: 0,
                            maxNumber: 10,
                            increaseCallback: () {},
                            decreaseCallback: () {},
                            counterCallback: (int count) {},
                            backgroundColor: Colors.green.shade300,
                            buttonFillColor: Colors.green.shade300,
                            buttonIconColor: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
