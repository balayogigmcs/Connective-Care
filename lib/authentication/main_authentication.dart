import 'package:flutter/material.dart';

class MainAuthentication extends StatefulWidget {
  const MainAuthentication({super.key});

  @override
  State<MainAuthentication> createState() => _MainAuthenticationState();
}

class _MainAuthenticationState extends State<MainAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
            child: Image.asset(
          'assets/images/cclogo1.png',
          fit: BoxFit.cover,
        ))
      ],
    ));
  }
}
