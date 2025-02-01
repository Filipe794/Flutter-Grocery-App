import 'package:flutter/material.dart';
import 'package:add_to_cart_button/add_to_cart_button.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';

class ShopBagButton extends StatelessWidget {
  double counter = 0;

  ShopBagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                // todo -> adicionar ao carrinho
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
    );
  }
}
