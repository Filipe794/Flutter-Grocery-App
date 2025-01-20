import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/screens/exportscreens.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> productsData = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
          await firestore.collection('products').limit(15).get();

      List<Map<String, dynamic>> products = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      print('Produtos recuperados do Firestore:');
      for (var product in products) {
        print(product);
      }

      products.shuffle();

      setState(() {
        productsData = products.take(6).toList();
      });
    } catch (e) {
      print('Erro ao recuperar produtos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Grocery App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Search(),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: Carousel(),
                ),
                SizedBox(height: 10),
                ClickableRow(
                  text: "Categories",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowCategoriesPage()),
                    );
                  },
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 75,
                  child: IconCarousel(),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                  ),
                  itemCount: productsData.length,
                  itemBuilder: (context, index) {
                    final item = productsData[index];
                    return ProductCard(
                      productData: item,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onHomePressed: () {},
        onAccountPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile()));
        },
        onFavoritePressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShowFavorites()));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShoppingCartPage()));
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
