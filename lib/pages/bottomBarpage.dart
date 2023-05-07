import 'package:flutter/material.dart';
import 'package:todo/pages/homePage.dart';
import 'package:todo/pages/mypagePage.dart';

class bottomBarpage extends StatefulWidget {
  const bottomBarpage({super.key});

  @override
  State<bottomBarpage> createState() => _bottomBarpageState();
}

class _bottomBarpageState extends State<bottomBarpage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const homePage(),
    const mypagePage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 95,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books),
              label: '리스트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '마이',
            ),
          ],
          iconSize: 30,
        ),
      ),
    );
  }
}
