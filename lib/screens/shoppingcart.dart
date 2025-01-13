import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/cartitem.dart'; // Certifique-se de que o caminho está correto
import 'package:groceryapp/widgets/pricerow.dart';
import 'package:groceryapp/widgets/custombutton.dart';
import 'package:groceryapp/screens/ordersucess.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Fresh Broccoli',
      'price': 2.22,
      'quantity': 5,
      'weight': '1.50 lbs',
      'image': 'lib/assets/peach.png',
    },
    {
      'name': 'Black Grapes',
      'price': 2.22,
      'quantity': 5,
      'weight': '5.0 lbs',
      'image': 'lib/assets/peach.png',
    },
    {
      'name': 'Avocado',
      'price': 2.22,
      'quantity': 5,
      'weight': '1.50 lbs',
      'image': 'lib/assets/peach.png',
    },
    {
      'name': 'Pineapple',
      'price': 2.22,
      'quantity': 5,
      'weight': 'dozen',
      'image': 'lib/assets/peach.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(
        0, (sum, item) => sum + item['price'] * item['quantity']);
    double shippingCharges = 1.6;
    double total = subtotal + shippingCharges;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title:
        const Text('Shopping Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: cartItems.isEmpty
          ? _buildEmptyCart() // Exibe a mensagem de carrinho vazio
          : _buildCartWithItems(subtotal, shippingCharges, total),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withOpacity(0.1),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.green,
              size: 80,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Go find something!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems(
      double subtotal, double shippingCharges, double total) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItem(
                item: item,
                onRemove: () {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
                onAdd: (int quantityChange) {
                  setState(() {
                    if (cartItems[index]['quantity'] + quantityChange >= 0) {
                      cartItems[index]['quantity'] += quantityChange;
                    }
                  });
                },
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
