import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductCard({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              productData: productData,
            ),
          ),
        );
      },
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
              Padding(
                padding: const EdgeInsets.only(top: 3.0, right: 3.0),
                child: FavoriteButton(size: 19),
              ),
            ]),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GoogleDriveImage(
                  googleDriveUrl: productData['imageurl'],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${productData['price'].toString()}0",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.green,
              ),
            ),
            Text(
              productData['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              productData['quantity'],
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            ShopBagButton(),
          ],
        ),
      ),
    );
  }
}
