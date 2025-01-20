import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/screens/exportscreens.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  AddAddressScreenState createState() => AddAddressScreenState();
}

class AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  bool _isDefault = false;

  void _saveAddress() {
    final Map<String, dynamic> addressData = {
      "name": _nameController.text,
      "phone": _phoneController.text,
      "address": _addressController.text,
      "zipCode": _zipCodeController.text,
      "city": _cityController.text,
      "country": _countryController.text,
      "isDefault": _isDefault,
    };

    print(addressData); // salvar no banco de dados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightGreen[100],
            centerTitle: true,
            title: Text("Add Address"),
            leading: BackButton()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person,color: Colors.green,),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone number",
                    prefixIcon: Icon(Icons.phone,color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    prefixIcon: Icon(Icons.location_on,color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(
                    labelText: "Zip code",
                    prefixIcon: Icon(Icons.map,color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: "City",
                    prefixIcon: Icon(Icons.location_city,color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: "Country",
                    prefixIcon: Icon(Icons.public,color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Make Default"),
                    SizedBox(width: 8),
                    Switch(
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.white,
                        value: _isDefault,
                        onChanged: (bool value) {
                          setState(() {
                            _isDefault = value;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: CustomButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyAddressScreen()));
            },
            buttonText: 'Add Address',
          ),
        ));
  }
}
