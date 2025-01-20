import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class ProductPage extends StatelessWidget {
  var productData;

  ProductPage({super.key, required this.productData});
  
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
    double rating = double.parse(productData['rating'].split(' ')[0]);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen[100],
        title: Text(productData['name']),
        leading: BackButton(),
        centerTitle: true,
      ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GoogleDriveImage(googleDriveUrl: productData['imageurl']),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${productData['price']}0',
                                style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
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
                          Text(productData['rating']),
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
