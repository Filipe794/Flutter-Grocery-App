import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/exportwidgets.dart';

class CategoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> iconData = [
    {
      'path': 'lib/assets/icons-carousel/apple.png',
      'color': Color(0xFFFFE9E5),
      'name': 'Fruits'
    },
    {
      'path': 'lib/assets/icons-carousel/baby.png',
      'color': Color(0xFFD2EFFF),
      'name': 'Babycare'
    },
    {
      'path': 'lib/assets/icons-carousel/food.png',
      'color': Color(0xFFD4C9EF),
      'name': 'Grocery'
    },
    {
      'path': 'lib/assets/icons-carousel/olive-oil.png',
      'color': Color(0xFFDCF4F5),
      'name': 'Edible Oil'
    },
    {
      'path': 'lib/assets/icons-carousel/salad.png',
      'color': Color(0xFFE6F2EA),
      'name': 'Vegetables'
    },
    {
      'path': 'lib/assets/icons-carousel/soda (1).png',
      'color': Color(0xFFFFF6E3),
      'name': 'Beverages'
    },
    {
      'path': 'lib/assets/icons-carousel/vacuum.png',
      'color': Color(0xFFFFE8F2),
      'name': 'Household'
    },
  ];

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0, right: 40.0),
                      child: Text(
                        "Nome da Categoria",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Placeholder para alinhamento
                  ],
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                  ),
                  itemCount: iconData.length,
                  itemBuilder: (context, index) {
                    final item = iconData[index];
                    return CategoryCard(path: item['path'], color: item['color'], name: item['name'], onTap: (){});
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
