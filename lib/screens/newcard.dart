import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class NewCardScreen extends StatefulWidget {
  @override
  _NewCardScreenState createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool _saveCard = false;

  String _cardHolderName = "CARD HOLDER";
  String _cardNumber = "XXXX  XXXX  XXXX  XXXX";
  String _expiryDate = "MM/YY";

  void _updateCardHolderName(String value) {
    setState(() {
      _cardHolderName = value.isEmpty ? "CARD HOLDER" : value.toUpperCase();
    });
  }

  void _updateCardNumber(String value) {
    setState(() {
      _cardNumber = value.isEmpty
          ? "XXXX  XXXX  XXXX  XXXX"
          : value.replaceAllMapped(RegExp(r".{1,4}"), (match) => "${match.group(0)} ").trim();
    });
  }

  void _updateExpiryDate(String value) {
    setState(() {
      _expiryDate = value.isEmpty ? "MM/YY" : value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        centerTitle: true,
        title: Text("Add Card"),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _cardNumber,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CARD HOLDER",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "EXPIRES",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _cardHolderName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _expiryDate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name on the card",
                  prefixIcon: Icon(Icons.person, color: Colors.green),
                  border: OutlineInputBorder(),
                ),
                onChanged: _updateCardHolderName,
              ),
              SizedBox(height: 16),
              TextField(maxLength: 16,
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Card number",
                  prefixIcon: Icon(Icons.credit_card, color: Colors.green),
                  counterText: "",
                  border: OutlineInputBorder(),
                ),
                onChanged: _updateCardNumber,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _expiryDateController,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Month / Year",
                        prefixIcon: Icon(Icons.calendar_today, color: Colors.green),
                        border: OutlineInputBorder(),
                        counterText: "",
                      ),
                      onChanged: (value) {
                        if (value.length == 2 && !_expiryDateController.text.contains('/')) {
                          _expiryDateController.text = '$value/';
                          _expiryDateController.selection = TextSelection.fromPosition(
                            TextPosition(offset: _expiryDateController.text.length),
                          );
                        }
                        if (value.length > 5) {
                          _expiryDateController.text = value.substring(0, 5);
                          _expiryDateController.selection = TextSelection.fromPosition(
                            TextPosition(offset: _expiryDateController.text.length),
                          );
                        }
                        _updateExpiryDate(_expiryDateController.text);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      maxLength: 3,
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "CVV",
                        counterText: "",
                        prefixIcon: Icon(Icons.lock, color: Colors.green),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("Save this card"),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: _saveCard,
                    onChanged: (bool value) {
                      setState(() {
                        _saveCard = value;
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
        child: CustomButton(onPressed: (){}, buttonText: "Add card"),
      ),
    );
  }
}
