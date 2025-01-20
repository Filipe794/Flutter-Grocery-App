import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceryapp/screens/exportscreens.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> searchProduct(BuildContext context) async {
    final query = _searchController.text.trim();

    if (query.isEmpty) {
      return;
    }

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var productData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        print('Produto encontrado: $productData');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(productData: productData),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductNotFoundPage()),
        );
      }
    } catch (e) {
      print('Erro ao buscar produto: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onSubmitted: (value) => searchProduct(context),
        decoration: InputDecoration(
          labelText: 'Buscar...',
          hintText: 'Digite o nome do produto',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 201, 197, 197).withOpacity(0.1),
        ),
      ),
    );
  }
}
