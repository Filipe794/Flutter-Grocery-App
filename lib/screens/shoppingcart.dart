import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/entity/app_state.dart';
import 'package:provider/provider.dart';


class ShoppingCartPage extends StatefulWidget {
  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

// todo ->  tornar carrinho funcional

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  @override
  void initState() {
    print(context.read<AppState>().basket);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title:
            const Text('Shopping Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightGreen[100],
        centerTitle: true,
        elevation: 0,
      ),
      body: context.watch<AppState>().basket.isEmpty
          ? EmptyCart()
          : CartWithItems(),
    );
  }
}
