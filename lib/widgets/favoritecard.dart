import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class FavoriteCard extends StatelessWidget {
  final Map<String, dynamic> productData;

  const FavoriteCard({
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
                  )),
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
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: FavoriteButton(size: 19, isFavorited: true),
                ),
              ],
            ),
            Container(
              width: 55,
              height: 55,
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
              style: const TextStyle(
                fontSize: 13.0,
                color: Colors.green,
              ),
            ),
            Text(
              productData['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              productData['category'],
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
