import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool _showWelcome = true;
  bool _showConnectiveCare = false;
  bool _showSubheading = false;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _subheadingController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _subheadingController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _subheadingController,
      curve: Curves.easeIn,
    );

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showWelcome = false;
        _showConnectiveCare = true;
      });
      _controller.forward().then((_) {
        setState(() {
          _showSubheading = true;
        });
        _subheadingController.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _subheadingController.dispose();
    super.dispose();
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
          Center(
            child: _showWelcome
                ? DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Welcome to Connective Care',
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          if (_showConnectiveCare)
            Positioned(
              top: MediaQuery.of(context).size.height / 5, // Adjust this value to place text between top and center
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SlideTransition(
                    position: _offsetAnimation,
                    child: const Center(
                      child: Text(
                        'CONNECTIVE CARE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  if (_showSubheading)
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        'Revolutionizing Non-Emergency Medical Transportation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
