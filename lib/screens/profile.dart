import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';
import 'package:groceryapp/services/authservice.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final AuthService _authService = AuthService();

  // todo -> recuperar informações do usuário (foto, nome, email, telefone, pedidos, endereços, cartoes, favoritos)
  // recuperar apenas ao clicar na página espefica de cada

  @override
  Widget build(BuildContext context) {
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
                    const Text(
                      "Olivia Austin",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "olivia@gmail.com",
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
                        _authService.logout();
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
