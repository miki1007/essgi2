import 'package:flutter/material.dart';
import 'package:pro/pages/login_page.dart'; // Import the LoginPage
import 'package:pro/pages/register.dart'; // Import the RegisterPage

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Initially show the login page.
  bool showLoginPage = true;

  // Toggle between the login & register page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage; // Toggle the page state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoginPage
          ? LoginPage(onTap: togglePage) // Pass togglePage to LoginPage
          : RegisterPage(onTap: togglePage), // Pass togglePage to RegisterPage
    );
  }
}
