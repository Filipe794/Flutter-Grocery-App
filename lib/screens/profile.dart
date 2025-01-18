import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[100],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 56.0), // Espaço para o BottomAppBar
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Informações do usuário
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('lib/assets/peach.png'),
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

                  // Itens do menu
                  Column(
                    children: [
                      _buildMenuItem(
                        icon: Icons.account_circle_outlined,
                        text: "About Me",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeScreen() ));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.inventory,
                        text: "My Orders",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrderScreen()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.favorite_border_outlined,
                        text: "My Favorites",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.room,
                        text: "My Address",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddressScreen() ));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.credit_card,
                        text: "Cards",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.logout,
                        text: "Sign Out",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onHomePressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
                  (Route<dynamic> route) => false,
            );
        },
        onAccountPressed: () {
        },
        onFavoritePressed: () {
          print("Favorite button pressed");
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartPage() ));
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  // Widget auxiliar para criar itens de menu
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
