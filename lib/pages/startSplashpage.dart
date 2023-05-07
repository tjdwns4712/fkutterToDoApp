import 'package:flutter/material.dart';

class startSplashpage extends StatefulWidget {
  const startSplashpage({super.key});

  @override
  State<startSplashpage> createState() => _startSplashpageState();
}

class _startSplashpageState extends State<startSplashpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'To Do',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 100,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000)).then(
      (value) {
        Navigator.pushReplacementNamed(context, '/bottomBarpage');
      },
    );
  }
}
