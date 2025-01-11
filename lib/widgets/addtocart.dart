import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/custombutton.dart';
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
  const QuantityAndCartWidget({Key? key}) : super(key: key);

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
            CustomButton(onPressed: (){}, buttonText: "Add to Cart"),
          ],
        ),
      ),
    );
  }
}
