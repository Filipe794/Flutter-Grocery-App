import 'package:flutter/material.dart';
import 'package:groceryapp/entity/app_state.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;

  const CartItem({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<AppState>().removeProduct(index);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          child: ListTile(
            leading: GoogleDriveImage(googleDriveUrl: item['imageurl']),
            title: Text(item['name'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${item['price']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
