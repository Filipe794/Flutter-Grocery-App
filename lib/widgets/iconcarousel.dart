import 'package:flutter/material.dart';

class IconCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> iconData = [
    {
      'path': 'lib/assets/icons-carousel/apple.png',
      'color': Color(0xFFFFE9E5),
      'route': '/applePage',
    },
    {
      'path': 'lib/assets/icons-carousel/baby.png',
      'color': Color(0xFFD2EFFF),
      'route': '/babyPage',
    },
    {
      'path': 'lib/assets/icons-carousel/food.png',
      'color': Color(0xFFD4C9EF),
      'route': '/foodPage',
    },
    {
      'path': 'lib/assets/icons-carousel/olive-oil.png',
      'color': Color(0xFFDCF4F5),
      'route': '/oliveOilPage',
    },
    {
      'path': 'lib/assets/icons-carousel/salad.png',
      'color': Color(0xFFE6F2EA),
      'route': '/saladPage',
    },
    {
      'path': 'lib/assets/icons-carousel/soda (1).png',
      'color': Color(0xFFFFF6E3),
      'route': '/sodaPage',
    },
    {
      'path': 'lib/assets/icons-carousel/vacuum.png',
      'color': Color(0xFFFFE8F2),
      'route': '/vacuumPage',
    },
  ];

  IconCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: iconData.length,
            itemBuilder: (context, index) {
              final item = iconData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, item['route']);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: item['color'],
                      child: Image.asset(
                        item['path'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
