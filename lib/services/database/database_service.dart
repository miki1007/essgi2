// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro/Models/user.dart';

/*
  DATABASE SERVICE
  This class handles all the data from and to Firebase.
  _______________________________________________________________
  - User profile
  - Post messages
  - Like
  - Comment
  - Account staff (report/delete account and block)
  - Follow/unfollow
  - Search user
 */
class DatabaseService {
  // Get the instance of Firestore DB and Auth
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /*
  USER PROFILE
  When the user registers, we can create an account and later store
  their details in the database to display their profile page.
  */

  // Save user info with role included
  Future<void> saveUserInfoInFirebase({
    required String name,
    required String email,
    required String role,
  }) async {
    try {
      // Get the current uid
      String uid = _auth.currentUser!.uid;
      // Extract the username from the email
      String username = email.split('@')[0];

      // Create user profile
      UserProfile user = UserProfile(
        uid: uid,
        name: name,
        email: email,
        username: username,
        bio: '', // Initialize bio as empty
        role: role, // Store user role
      );

      // Convert user into a map
      final userMap = user.toMap();

      // Save user info to Firebase
      await _db.collection("Users").doc(uid).set(userMap);
    } catch (e) {
      print('Error saving user info: $e');
      throw Exception('Failed to save user information.');
    }
  }

  // Get user info from Firebase
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      // Retrieve the user doc from Firebase
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();

      // Check if user exists
      if (userDoc.exists) {
        // Convert doc to user profile
        return UserProfile.fromDocument(userDoc);
      } else {
        print("User does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching user info: $e");
      return null;
    }
  }

  // Update user profile information
  Future<void> updateUserInFirebase(
      String uid, String name, String email, String phone) async {
    try {
      // Update the user's profile information in Firestore
      await _db.collection('Users').doc(uid).update({
        'name': name,
        'email': email,
        'phoneNumber': phone,
      });
    } catch (e) {
      print("Error updating user profile: $e");
      throw Exception('Failed to update user information.');
    }
  }
}
