import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int nextPage = _pageController.page?.round() ?? 0; 
      if (nextPage != _currentPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // PageView como fundo
        SizedBox(
          height: 200, // Altura fixa do carrossel
          child: PageView(
            controller: _pageController,
            children: [
              Container(
                color: Colors.red,
                child: Center(child: Text('Imagem 1', style: TextStyle(fontSize: 24, color: Colors.white))),
              ),
              Container(
                color: Colors.green,
                child: Center(child: Text('Imagem 2', style: TextStyle(fontSize: 24, color: Colors.white))),
              ),
              Container(
                color: Colors.blue,
                child: Center(child: Text('Imagem 3', style: TextStyle(fontSize: 24, color: Colors.white))),
              ),
            ],
          ),
        ),

        // Indicadores sobrepostos ao carrossel
        Positioned(
          bottom: 8, // Posiciona os indicadores na parte inferior do carrossel
          left: 5,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.all(4),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.green[300] : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
