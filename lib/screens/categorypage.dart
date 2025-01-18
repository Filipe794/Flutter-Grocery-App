import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({
    required this.categoryName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: Text(categoryName),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductCard(path: 'lib/assets/peach.png', color: Color(0xFFFFE9E5), name: 'Peach', productPrice: "\$8.0", productQuantity: '2');
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

