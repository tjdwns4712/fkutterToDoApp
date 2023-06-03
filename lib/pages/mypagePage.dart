import 'package:flutter/material.dart';

class mypagePage extends StatefulWidget {
  const mypagePage({super.key});

  @override
  State<mypagePage> createState() => _mypagePageState();
}

class _mypagePageState extends State<mypagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Test Page',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
