import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class MyAddressScreen extends StatelessWidget {
  final List<Map<String, dynamic>> addresses = [
    {
      "name": "Russell Austin",
      "address": "2811 Crescent Day, LA Port",
      "city": "California",
      "country": "United States",
      "phone": "+1 202 555 0142",
      "isDefault": true,
    },
    {
      "name": "Jissca Simpson",
      "address": "2811 Crescent Day, LA Port",
      "city": "California",
      "country": "United States",
      "phone": "+1 202 555 0142",
      "isDefault": false,
    },
  ];

  MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen[100],
        title: Text('My Address'),
        leading: BackButton(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddAddressScreen()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return ExpandableAddressCard(
            name: address["name"],
            address: address["address"],
            city: address["city"],
            country: address["country"],
            phone: address["phone"],
            isDefault: address["isDefault"],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: CustomButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
          },
          buttonText: 'Save settings',
        ),
      ),
    );
  }
}

class ExpandableAddressCard extends StatefulWidget {
  final String name;
  final String address;
  final String city;
  final String country;
  final String phone;
  final bool isDefault;

  ExpandableAddressCard({
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.phone,
    this.isDefault = false,
  });

  @override
  _ExpandableAddressCardState createState() => _ExpandableAddressCardState();
}

class _ExpandableAddressCardState extends State<ExpandableAddressCard> {
  bool isExpanded = false;
  bool isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: Icon(
                widget.isDefault ? Icons.home : Icons.location_on,
                color: Colors.green,
              ),
            ),
            title: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.address),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: TextEditingController(text: widget.name),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: widget.address),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: widget.city),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: widget.phone),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // excluir endereço
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
                          style: ElevatedButton.styleFrom(),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Switch(
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.white,
                              value: isDefault,
                              onChanged: (bool value) {
                                setState(() {
                                  isDefault = value;
                                });
                                if (value) {
                                  // Ação para definir como padrão
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Set as Default Enabled'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  // Ação ao desativar o padrão
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Set as Default Disabled'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }))
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
