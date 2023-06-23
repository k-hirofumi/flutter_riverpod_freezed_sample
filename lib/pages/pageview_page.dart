import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  _MyPageViewPageState createState() => _MyPageViewPageState();
}

class _MyPageViewPageState extends State<PageViewPage> {
  final _controller = PageController();
  final _colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Carousel with Indicator')),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          SizedBox(
            height: 400,
            width: 300,
            child: PageView(
              controller: _controller,
              children: _colors
                  .map(
                    (color) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(1),
                          color: color),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _colors.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(
                  entry.key,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currentPage == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
