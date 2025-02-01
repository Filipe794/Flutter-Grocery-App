import 'package:flutter/material.dart';
import 'package:groceryapp/entity/app_state.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/screens/myadress.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {

    Future<void> _saveAddress() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final addressData = {
          "name": _nameController.text,
          "phone": _phoneController.text,
          "address": _addressController.text,
          "zipCode": _zipCodeController.text,
          "city": _cityController.text,
          "country": _countryController.text,
          "isDefault": _isDefault,
          "createdAt": Timestamp.now(),
        };

        try {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            'addresses': FieldValue.arrayUnion([addressData]),
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Endereço adicionado com sucesso!'),
            backgroundColor: Colors.green,
          ));

          context.read<AppState>().addAddress(addressData);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyAddressScreen()),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Erro ao adicionar endereço: $e'),
            backgroundColor: Colors.red,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuário não autenticado!'),
          backgroundColor: Colors.red,
        ));
      }
    }

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
                    prefixIcon: Icon(Icons.person, color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone number",
                    prefixIcon: Icon(Icons.phone, color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    prefixIcon: Icon(Icons.location_on, color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(
                    labelText: "Zip code",
                    prefixIcon: Icon(Icons.map, color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: "City",
                    prefixIcon: Icon(Icons.location_city, color: Colors.green),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: "Country",
                    prefixIcon: Icon(Icons.public, color: Colors.green),
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
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: CustomButton(
            onPressed: _saveAddress,
            buttonText: 'Add Address',
          ),
        ));
  }
}
