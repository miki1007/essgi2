import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/pages/admin_pages/dashboard_page.dart';
import 'package:pro/pages/login_page.dart';
import 'package:pro/pages/user_dashboard_page.dart';

class AuthGet extends StatelessWidget {
  final VoidCallback toggleTheme;

  const AuthGet({Key? key, required this.toggleTheme}) : super(key: key);

  Future<String?> _getUserRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Fetch user role from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users') // Ensure this is the correct collection
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        // Ensure the role field exists
        String? role = userDoc.get('role');
        return role;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            User? user = snapshot.data as User?;

            return FutureBuilder<String?>(
              future: _getUserRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading user role'));
                } else if (snapshot.hasData) {
                  String? role = snapshot.data;

                  if (role == 'admin') {
                    // Redirect to Admin Dashboard if role is 'admin'
                    return AdminDashboardPage(
                      uid: user!.uid,
                      toggleTheme: toggleTheme, // Use a valid callback here
                    );
                  } else {
                    // Redirect to User Dashboard if role is not 'admin'
                    return UserDashboardPage(
                      toggleTheme: toggleTheme, // Use a valid callback here
                      uid: user!.uid,
                    );
                  }
                } else {
                  return const Center(child: Text('User role not found'));
                }
              },
            );
          } else {
            // User is not logged in
            return LoginPage(onTap: toggleTheme); // Ensure onTap is passed
          }
        },
      ),
    );
  }
}
