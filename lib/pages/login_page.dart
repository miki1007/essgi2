import 'package:flutter/material.dart';
import 'package:pro/component/my_button.dart';
import 'package:pro/component/my_loading_circle.dart';
import 'package:pro/component/my_text_field.dart';
import 'package:pro/services/Auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService(); // Authentication service
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  bool _isPasswordVisible = false;

  // Login function with validation
  void login() async {
    final email = emailController.text.trim();
    final password = pwController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show error dialog if fields are empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in both email and password fields'),
        ),
      );
      return;
    }

    try {
      showLoadingCircle(context); // Show loading

      // Sign in with Firebase Auth (use the correct method name)
      await _auth.loginEmailPassword(email, password);

      hideLoadingCircle(context); // Hide loading

      // Navigate to user dashboard
      Navigator.pushReplacementNamed(context, '/user_dashboard');
    } catch (e) {
      hideLoadingCircle(context); // Hide loading

      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/img/login_img.jpg',
                    height: 150,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Welcome to ESSGI",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: pwController,
                    hintText: "Enter your password",
                    obscureText: !_isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyButton(text: "Login", onTap: login),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          " Register Now",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
