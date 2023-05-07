import 'package:flutter/material.dart';
import 'package:todo/pages/bottomBarpage.dart';
import 'package:todo/pages/startSplashpage.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const startSplashpage(), // 시작 실행화면
        '/bottomBarpage': (context) => const bottomBarpage(), // 하단바
      },
    );
  }
}
