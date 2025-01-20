import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;

  const CategoryPage({
    required this.categoryName,
    super.key,
  });

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  List<Map<String, dynamic>> productsData = [];

  Future<void> fetchProductsByCategory() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await firestore
          .collection('products')
          .where('category', isEqualTo: widget.categoryName)
          .get();

      List<Map<String, dynamic>> fetchedProducts =
          querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      setState(() {
        productsData = fetchedProducts;
      });
    } catch (e) {
      print('Erro ao recuperar produtos: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProductsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: Text(widget.categoryName),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productsData.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
