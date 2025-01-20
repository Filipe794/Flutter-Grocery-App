import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 65, 58, 75),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/FruitsPage': (context) => CategoryPage(
              categoryName: 'Fruits',
            ),
        '/BabycarePage': (context) => CategoryPage(
              categoryName: 'Babycare',
            ),
        '/GroceryPage': (context) => CategoryPage(
              categoryName: 'Grocery',
            ),
        '/EdibleOilPage': (context) => CategoryPage(
              categoryName: 'Oils',
            ),
        '/VegetablesPage': (context) => CategoryPage(
              categoryName: 'Vegetables',
            ),
        '/BeveragesPage': (context) => CategoryPage(
              categoryName: 'Beverages',
            ),
        '/HouseholdPage': (context) => CategoryPage(
              categoryName: 'Cleaning',
            ),
      },
    );
  }
}

// verifica se o usuario está logado e direciona para a tela correta
class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthPage();
          }
        });
  }
}
