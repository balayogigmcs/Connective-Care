import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cc/authentication/main_authentication.dart';

class AnimateScreen extends StatefulWidget {
  const AnimateScreen({super.key});

  @override
  _AnimateScreenState createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
  bool _showConnectiveCare = true;
  bool _showSubheading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showSubheading = true;
      });
    });
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
          Positioned(
            top: 60,
            right: 20,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainAuthentication()));
              },
              style: OutlinedButton.styleFrom(
                //backgroundColor: Colors.blue,
                //foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          if (_showConnectiveCare)
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
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
                        cursor: '',
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
