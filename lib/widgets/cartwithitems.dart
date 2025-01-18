import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/screens/exportscreens.dart';


class CartWithItems extends StatelessWidget {
  final double subtotal;
  final double shippingCharges;
  final double total;
  final List<Map<String, dynamic>> cartItems;
  final Function(int) onRemove;
  final Function(int, int) onUpdateQuantity;

  CartWithItems(
      this.subtotal, this.shippingCharges, this.total, this.cartItems, this.onRemove, this.onUpdateQuantity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Dismissible(
                key: Key(item['name']),
                onDismissed: (direction) {
                  onRemove(index);
                },
                background: Container(color: Colors.red),
                child: CartItem(
                  item: item,
                  onRemove: () => onRemove(index),
                  onAdd: (int quantityChange) => onUpdateQuantity(index, quantityChange),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PriceRow(label: 'Subtotal', value: subtotal),
              const SizedBox(height: 8),
              PriceRow(label: 'Shipping charges', value: shippingCharges),
              const Divider(),
              PriceRow(label: 'Total', value: total),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderSuccessScreen()),
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
