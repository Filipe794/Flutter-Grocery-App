import 'package:flutter/material.dart';
class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function onRemove;
  final Function onAdd;

  const CartItem({
    required this.item,
    required this.onRemove,
    required this.onAdd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item['name']),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onRemove();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${item['name']} removed'))
        );
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
            leading: Image.asset(item['image'], width: 50, height: 50),
            title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${item['price']} x ${item['quantity']}'),
                Text(item['weight']),
              ],
            ),
            trailing: SizedBox(
              width: 120,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (item['quantity'] > 0) {
                        onAdd(-1); // Decrease quantity
                      }
                    },
                  ),
                  Text('${item['quantity']}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => onAdd(1), // Increase quantity
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
