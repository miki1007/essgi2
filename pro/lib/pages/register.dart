import 'package:flutter/material.dart';
import 'package:pro/component/my_loading_circle.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/database/database_service.dart';

import '../component/my_button.dart';
import '../component/my_text_field.dart';

/*
    REGISTER PAGE
    On this page, the user can fill out the form and create an account. 
    The data we want from the user is:
    - Name 
    - Email 
    - Password 
    - Confirm Password 
   _________________________________________________________ 
   Once the user successfully creates an account, they will be redirected to the home page. 
   Also, if the user already has an account, they can go to the login page from here. 
 */

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  // Access the auth & db service
  final _auth = AuthService();
  final _db = DatabaseService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // To toggle password visibility
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Register button tap
  void register() async {
    // Check if passwords match
    if (pwController.text == confirmPwController.text) {
      // Attempt to register
      try {
        // Show loading circle
        showLoadingCircle(context);
        // Try to register
        await _auth.registerEmailPassword(
            emailController.text, pwController.text);

        // Finished loading...
        if (mounted) hideLoadingCircle(context);

        // Once registered, create and save user profile in the database
        await _db.saveUserInfoInFirebase(
            name: nameController.text, email: emailController.text);

        // Navigate to home page or another page after registration
      } catch (e) {
        // Finished loading...
        if (mounted) hideLoadingCircle(context);

        // Show error dialog
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    } else {
      // Passwords don't match -> show error
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text("Passwords don't match")),
      );
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    // Scaffold
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
                  // Sized box
                  const SizedBox(height: 50),
                  // Logo
                  Icon(
                    Icons.lock_open,
                    size: 75,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 50),
                  // Welcome text
                  Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  // Name text field
                  MyTextField(
                    controller: nameController,
                    hintText: "Enter your name",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // Email text field
                  MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // Password text field with visibility toggle
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
                  const SizedBox(height: 10),
                  // Confirm password text field with visibility toggle
                  MyTextField(
                    controller: confirmPwController,
                    hintText: "Confirm your password",
                    obscureText: !_isConfirmPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Register button
                  MyButton(text: "Register", onTap: register),
                  const SizedBox(height: 50),
                  // Already a member? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      // User can tap this to go to the login page
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          " Login Now",
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
