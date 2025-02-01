import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:add_to_cart_button/add_to_cart_button.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> productData;

  const ProductCard({
    super.key,
    required this.productData,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int counter = 0;
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
  }

  void _toggleFavorite() {
    final appState = Provider.of<AppState>(context, listen: false);

    setState(() {
      isFavorited = !isFavorited;
    });

    if (isFavorited) {
      appState.addFavorite(widget.productData['id']);
    } else {
      appState.removeFavorite(widget.productData['id']);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userFavorites = context.read<AppState>().userData['favorites'] ?? [];
    isFavorited = userFavorites.contains(widget.productData['id']);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              productData: widget.productData,
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
                child: FavoriteButton(
                  size: 19,
                  isFavorited: isFavorited,
                  onTap: _toggleFavorite,
                ),
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
                  googleDriveUrl: widget.productData['imageurl'],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${widget.productData['price'].toString()}0",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.green,
              ),
            ),
            Text(
              widget.productData['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              widget.productData['quantity'],
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
                      onPressed: () {
                        for (var i = 0; i < counter; i++) {
                          context
                              .read<AppState>()
                              .addProduct(widget.productData);
                        }
                      },
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
                        increaseCallback: () {
                          counter++;
                        },
                        decreaseCallback: () {
                          counter--;
                        },
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
