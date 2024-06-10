import 'package:flutter/material.dart';
import 'package:cc/animation.dart';
import 'package:cc/authentication/form_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:cc/authentication/toast.dart';
import 'package:cc/authentication/signup_page.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxFormWidth = 400.0; // Set a maximum width for form fields

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'Login',
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
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
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
                  controller: _emailController,
                  hintText: 'Email',
                  isPasswordField: false,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxFormWidth),
                child: FormContainerWidget(
                  controller: _passwordController,
                  hintText: 'Password',
                  isPasswordField: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if(_isLoading)
                const CircularProgressIndicator()
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
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.google),
                          SizedBox(width: 10,),
                          Text(
                            'Sign In with Google',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: const Text(
                      'Sign Up',
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

//   void _signIn() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     String email = _emailController.text;
//     String password = _passwordController.text;

//     User? user = await _auth.signInWithEmailAndPassword(email, password);

//     setState(() {
//       _isLoading = false;
//     });

//     if (user != null) {
//       showtoast(message: 'User is successfully SignedIn');
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const AnimateScreen()));
//     } else {
//       setState(() {
//         _errorMessage = 'Something went wrong. Please try again.';
//       });
//     }
//   }
 }
