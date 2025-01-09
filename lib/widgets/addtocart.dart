import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quantity & Cart Buttons',
      home: const Scaffold(
        body: Center(
          child: QuantityAndCartWidget(),
        ),
      ),
    );
  }
}

class QuantityAndCartWidget extends StatefulWidget {
  const QuantityAndCartWidget({super.key});

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Quantity Buttons
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
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Add to Cart Button
        ElevatedButton.icon(
          onPressed: () {
            // Add to cart logic here
          },
          icon: const Icon(Icons.shopping_bag),
          label: const Text('Add to cart'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
