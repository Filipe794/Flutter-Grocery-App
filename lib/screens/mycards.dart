import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/custombutton.dart';
import 'package:groceryapp/screens/exportscreens.dart';

class MyCardsScreen extends StatefulWidget {
  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  final List<Map<String, dynamic>> cards = [
    {
      "name": "Master Card",
      "number": "XXXX XXXX XXXX 5678",
      "expiry": "01/22",
      "cvv": "908",
      "owner": "Russell Austin",
      "isDefault": true,
    },
    {
      "name": "Visa Card",
      "number": "XXXX XXXX XXXX 5678",
      "expiry": "01/22",
      "cvv": "908",
      "owner": "Russell Austin",
      "isDefault": false,
    },
    {
      "name": "Master Card",
      "number": "XXXX XXXX XXXX 5678",
      "expiry": "01/22",
      "cvv": "908",
      "owner": "Russell Austin",
      "isDefault": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: const Text('My Cards'),
        leading: const BackButton(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewCardScreen()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return ExpandableCard(
            name: card["name"],
            number: card["number"],
            expiry: card["expiry"],
            cvv: card["cvv"],
            owner: card["owner"],
            isDefault: card["isDefault"],
            onSetDefault: () {
              setState(() {
                for (var i = 0; i < cards.length; i++) {
                  cards[i]["isDefault"] = i == index;
                }
              });
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: CustomButton(onPressed: (){}, buttonText: "Save Settings")
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final String name;
  final String number;
  final String expiry;
  final String cvv;
  final String owner;
  final bool isDefault;
  final VoidCallback onSetDefault;

  ExpandableCard({
    required this.name,
    required this.number,
    required this.expiry,
    required this.cvv,
    required this.owner,
    required this.isDefault,
    required this.onSetDefault,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: widget.isDefault
                  ? Colors.green.shade100
                  : Colors.grey.shade200,
              child: widget.isDefault
                  ? Icon(Icons.credit_card, color: Colors.green.shade600)
                  : Icon(Icons.credit_card, color: Colors.grey.shade600),
            ),
            title: Text(
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "XXXX XXXX XXXX ${widget.number.split(" ").last}",
              style: const TextStyle(fontSize: 14),
            ),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isExpanded
                ? Padding(
              key: ValueKey<bool>(isExpanded),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: TextEditingController(text: widget.owner),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Card Owner',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: widget.number),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: widget.expiry),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Expiry Date',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: widget.cvv),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'CVV',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Make default"),
                      SizedBox(width: 8),
                      Switch(
                        value: widget.isDefault,
                        onChanged: (value) {
                          if (!widget.isDefault && value) {
                            widget.onSetDefault();
                          }
                        },
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
