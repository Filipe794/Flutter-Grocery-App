import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:add_to_cart_button/add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final String path;
  final Color color;
  final String productPrice;
  final String productQuantity;
  final String name;

  const ProductCard({
    super.key,
    required this.path,
    required this.color,
    required this.name,
    required this.productPrice,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductPage()));},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Transform.scale(scale: 0.8, child:FavoriteButton(onTap: () {})),
            ]),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  path,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productPrice,
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.green,
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              productQuantity,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.5,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      child: Icon(Icons.shopping_bag_outlined),
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
      ),
    );
  }
}