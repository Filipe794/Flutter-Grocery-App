import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "orderNumber": "#90897",
      "orderDate": "October 19 2021",
      "items": 10,
      "total": 16.90,
      "statuses": [
        {"status": "Order placed", "time": "20:21", "isCompleted": true},
        {"status": "Order confirmed", "time": "21:10", "isCompleted": true},
        {"status": "Order shipped", "time": "Pending", "isCompleted": false},
        {"status": "Out for delivery", "time": "Pending", "isCompleted": false},
        {"status": "Order delivered", "time": "Pending", "isCompleted": false},
      ],
    },
    {
      "orderNumber": "#12345",
      "orderDate": "August 29 2021",
      "items": 5,
      "total": 9.50,
      "statuses": [
        {"status": "Order placed", "time": "17:30", "isCompleted": true},
        {"status": "Order confirmed", "time": "17:40", "isCompleted": true},
        {"status": "Order shipped", "time": "18:00", "isCompleted": true},
        {"status": "Out for delivery", "time": "18:20", "isCompleted": true},
        {"status": "Order delivered", "time": "18:25", "isCompleted": true},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.lightGreen[100],
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ExpandableOrderCard(
            orderNumber: order['orderNumber'],
            orderDate: order['orderDate'],
            items: order['items'],
            total: order['total'],
            statuses: List<Map<String, dynamic>>.from(order['statuses']),
          );
        },
      ),
    );
  }
}

class ExpandableOrderCard extends StatefulWidget {
  final String orderNumber;
  final String orderDate;
  final int items;
  final double total;
  final List<Map<String, dynamic>> statuses;

  ExpandableOrderCard({
    required this.orderNumber,
    required this.orderDate,
    required this.items,
    required this.total,
    required this.statuses,
  });

  @override
  _ExpandableOrderCardState createState() => _ExpandableOrderCardState();
}

class _ExpandableOrderCardState extends State<ExpandableOrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            leading:
                const Icon(Icons.shopping_bag_outlined, color: Colors.green),
            title: Text(
              'Order ${widget.orderNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                'Placed on ${widget.orderDate}\nItems: ${widget.items}  Total: \$${widget.total.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightGreen[100], shape: BoxShape.circle),
                  child:
                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more)),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children:
                        List.generate(widget.statuses.length * 2 - 3, (index) {
                      if (index.isEven) {
                        // Renderiza o ponto
                        int pointIndex = index ~/ 2;
                        return Icon(
                          Icons.circle,
                          size: 12,
                          color: widget.statuses[pointIndex]['isCompleted']
                              ? Colors.green
                              : Colors.grey,
                        );
                      } else {
                        // Renderiza a linha
                        int lineIndex = index ~/ 2;
                        return Container(
                          width: 2,
                          height: 40,
                          color: widget.statuses[lineIndex + 1]['isCompleted']
                              ? Colors.green
                              : Colors.grey,
                        );
                      }
                    }),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.statuses.map((status) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status['status'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: status['isCompleted']
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                status['time'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: status['isCompleted']
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
