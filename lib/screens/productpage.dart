import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';

class ProductPage extends StatefulWidget {
  dynamic productData;

  ProductPage({super.key, required this.productData});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int counter = 1;

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

  void incrementQuantity() {
    setState(() {
      counter++;
    });
  }

  void decrementQuantity() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double rating = double.parse(widget.productData['rating'].split(' ')[0]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: Text(widget.productData['name']),
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
                          GoogleDriveImage(
                              googleDriveUrl: widget.productData['imageurl']),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${widget.productData['price']}0',
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
                            widget.productData['name'],
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
                            widget.productData['quantity'],
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
                          Text(widget.productData['rating']),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SizedBox(
                              width: 370,
                              child: Text(
                                widget.productData['description'],
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
            Transform.scale(
              scale: 0.90,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: decrementQuantity,
                          icon: const Icon(Icons.remove),
                          color: Colors.black,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '$counter',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ),
                        IconButton(
                          onPressed: incrementQuantity,
                          icon: const Icon(Icons.add),
                          color: Colors.black,
                        )
                      ],
                    ),
                    CustomButton(
                        onPressed: () {
                          for (var i = 0; i < counter; i++) {
                            context
                                .read<AppState>()
                                .addProduct(widget.productData);
                          }
                        },
                        buttonText: "Add to Cart"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
