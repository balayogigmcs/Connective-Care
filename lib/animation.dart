import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //bool _showWelcome = true;
  bool _showConnectiveCare = true;
  bool _showSubheading = false;

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 4), () {
    //   setState(() {
    //     //_showWelcome = false;
    //     _showConnectiveCare = true;
    //   });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showSubheading = true;
      });
    });
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/cclogo1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Center(
          //   child: _showWelcome
          //       ? DefaultTextStyle(
          //           style: const TextStyle(
          //             fontSize: 28.0,
          //             fontWeight: FontWeight.bold,
          //             color: Color.fromARGB(255, 0, 0, 0),
          //           ),
          //           child: AnimatedTextKit(
          //             animatedTexts: [
          //               TypewriterAnimatedText(
          //                 'Welcome to Connective Care',
          //                 speed: const Duration(milliseconds: 100),
          //               ),
          //             ],
          //             totalRepeatCount: 1,
          //           ),
          //         )
          //       : const SizedBox.shrink(),
          // ),
          if (_showConnectiveCare)
            Positioned(
              top: MediaQuery.of(context).size.height /
                  4, // Adjust this value to place text between top and center
              left: 0,
              right: 0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'CONNECTIVE CARE',
                        speed: const Duration(milliseconds: 100),
                        cursor: ''
                      ),
                    ],
                    totalRepeatCount: 1,
                    onFinished: () {
                      setState(() {
                        _showSubheading = true;
                      });
                    },
                  ),
                ),
              ),
            ),
          if (_showSubheading)
            Positioned(
              top: MediaQuery.of(context).size.height / 4 + 40,
              left: 0,
              right: 0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Revolutionizing Non-Emergency Medical Transportation',
                        speed: const Duration(milliseconds: 50),
                        cursor: '',
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
