import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';

class AboutMeScreen extends StatefulWidget {
  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;

  void _saveSettings() {
    final String currentPassword = _currentPasswordController.text;
    final String newPassword = _newPasswordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    // todo -> validar a currentPassword

    if (newPassword == confirmPassword) {
      // todo -> enviar alteração de senha para o firebase auth
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: As senhas não coincidem')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<AppState>().userData;

    return Scaffold(
      appBar: AppBar(
        title: Text("About me"),
        leading: BackButton(),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Personal Details",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              _buildDetailTile(Icons.person, userData["name"]!),
              SizedBox(height: 16),
              _buildDetailTile(Icons.email, userData["email"]!),
              SizedBox(height: 16),
              _buildDetailTile(Icons.phone, userData["phone"]!),
              SizedBox(height: 32),
              Text(
                "Change Password",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Current password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _newPasswordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "New password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Confirm password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              CustomButton(
                  onPressed: () {
                    _saveSettings();
                  },
                  buttonText: "Save Settings")
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailTile(IconData icon, String detail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              detail,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
