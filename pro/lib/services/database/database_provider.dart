import 'package:flutter/material.dart';
import 'package:pro/Models/user.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/database/database_service.dart';

/*
   DATABASE PROVIDER
   This provider is to separate the Firestore data handling and UI of our App.

   - The DatabaseService class handles data to and from Firebase.
   - The DatabaseProvider class processes the data to display in our app.

   This makes our code much more modular, easier, and cleaner to read and test.
   Particularly as the number of pages grow, we need this provider to properly manage
   the different states of the app.

   Also, if one day we decide to change our backend (from Firebase to something else),
   then it is much easier to manage and switch out different databases.
 */
class DatabaseProvider extends ChangeNotifier {
  /*
  SERVICES
  */
  // Get the Auth and Database services
  // ignore: unused_field
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  /*
  USER PROFILE
  */
  // Get user profile with the given uid
  Future<UserProfile?> userProfile(String uid) =>
      _databaseService.getUserFromFirebase(uid);

  // New method to update user profile
  Future<void> updateUserProfile(
      String uid, String name, String email, String phone) {
    return _databaseService.updateUserInFirebase(uid, name, email, phone);
  }
}
