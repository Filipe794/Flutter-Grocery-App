import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/entity/app_state.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartWithItems extends StatelessWidget {
  const CartWithItems();

  @override
  Widget build(BuildContext context) {
    double shippingCharges = 1.6;
    double totalPrice = 0;

    String calculateTotal() {
      for (var product in context.read<AppState>().basket) {
        totalPrice += product['price'];
      }
      totalPrice += shippingCharges;
      return NumberFormat.simpleCurrency().format(totalPrice);
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: context.read<AppState>().basket.length,
            itemBuilder: (BuildContext context, index) {
              final item = context.read<AppState>().basket[index];
              return CartItem(
                item: item,
                index: index,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping Charges', style: const TextStyle(fontSize: 16)),
                  Text('\$${shippingCharges.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: const TextStyle(fontSize: 16)),
                  Text(calculateTotal(), style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () {
                  context.read<AppState>().basket.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderSuccessScreen(),
                    ),
                  );
                },
                buttonText: "Checkout",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
