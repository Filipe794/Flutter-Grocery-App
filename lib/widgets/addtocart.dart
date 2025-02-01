import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class QuantityAndCartWidget extends StatefulWidget {
  dynamic productData;

  QuantityAndCartWidget({super.key, required this.productData});

  @override
  State<QuantityAndCartWidget> createState() => _QuantityAndCartWidgetState();
}

class _QuantityAndCartWidgetState extends State<QuantityAndCartWidget> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
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
                    '$quantity',
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
            CustomButton(onPressed: (){
              widget.productData['qnt_cart'] = quantity;
              jsonEncode(widget.productData);
            }, buttonText: "Add to Cart"),
          ],
        ),
      ),
    );
  }
}
