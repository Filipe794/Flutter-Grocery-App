import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Map<String, dynamic>> cartItems = [
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

  // Função para remover um item do carrinho
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index); // Remove o item da lista
    });
  }

  // Função para alterar a quantidade de um item no carrinho
  void _updateQuantity(int index, int quantityChange) {
    setState(() {
      if (cartItems[index]['quantity'] + quantityChange >= 0) {
        cartItems[index]['quantity'] += quantityChange; // Atualiza a quantidade
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
    double shippingCharges = 1.6;
    double total = subtotal + shippingCharges;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Shopping Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightGreen[100],
        centerTitle: true,
        elevation: 0,
      ),
      body: cartItems.isEmpty
          ? EmptyCart()
          : CartWithItems(subtotal, shippingCharges, total, cartItems, _removeItem, _updateQuantity),
    );
  }
}
