import 'package:flutter/material.dart';
import 'package:cc/authentication/form_container.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:cc/authentication/toast.dart';
import 'package:cc/authentication/login_page.dart';
import 'package:cc/animation.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxFormWidth = 400.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 30),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxFormWidth),
                child: FormContainerWidget(
                  controller: _usernameController,
                  hintText: 'Username',
                  isPasswordField: false,
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxFormWidth),
                child: FormContainerWidget(
                  controller: _emailController,
                  hintText: 'Email',
                  isPasswordField: false,
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxFormWidth),
                child: FormContainerWidget(
                  controller: _passwordController,
                  hintText: 'Password',
                  isPasswordField: true,
                ),
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxFormWidth),
                  child: GestureDetector(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimateScreen()));
                  },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _signUp() async {
  //   setState(() {
  //     _isLoading = true;
  //     _errorMessage = '';
  //   });

  //   //String username = _usernameController.text;
  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signUpWithEmailAndPassword(email, password);

  //   setState(() {
  //     _isLoading = false;
  //   });

  //   if (user != null) {
  //     showtoast(message: 'User is successfully created');
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  //   } else {
  //     setState(() {
  //       _errorMessage = 'Something went wrong. Please try again.';
  //     });
  //   }
  // }
}