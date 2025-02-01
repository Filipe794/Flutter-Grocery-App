import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/services/authservice.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    final userData = context.watch<AppState>().userData;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[100],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Image.asset('lib/assets/googlelogo.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userData['name'] ?? "Nome não disponível",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      userData['email'] ?? "E-mail não disponível",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.account_circle_outlined,
                      text: "About Me",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutMeScreen()));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.inventory,
                      text: "My Orders",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrderScreen()));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.favorite_border_outlined,
                      text: "My Favorites",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowFavorites()));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.room,
                      text: "My Address",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAddressScreen()));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.credit_card,
                      text: "Cards",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyCardsScreen()));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.logout,
                      text: "Sign out",
                      onTap: () {
                        _authService.logout(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
