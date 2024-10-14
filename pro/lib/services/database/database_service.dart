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
  final _Auth = FirebaseAuth.instance;

  /*
  USER PROFILE
  When the user registers, we can create an account and later store
  their details in the database to display their profile page.
  */
  // Save user info
  Future<void> saveUserInfoInFirebase({
    required String name,
    required String email,
  }) async {
    // Get the current uid
    String uid = _Auth.currentUser!.uid;
    // Extract the username from the email
    String username = email.split('@')[0];
    // Create user profile
    UserProfile user = UserProfile(
      uid: uid,
      name: name,
      email: email,
      username: username,
      bio: '',
    );
    // Convert user into a map
    final userMap = user.toMap();
    // Save user info to Firebase
    await _db.collection("Users").doc(uid).set(userMap);
  }

  // Get user info
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      // Retrieve the user doc from Firebase
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();
      // Convert doc to user profile
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Update user profile information
  Future<void> updateUserInFirebase(
      String uid, String name, String email, String phone) async {
    try {
      await _db.collection('Users').doc(uid).update({
        'name': name,
        'email': email,
        'phoneNumber': phone,
      });
    } catch (e) {
      print("Error updating user profile: $e");
      throw e; // Rethrow to handle in the provider if needed
    }
  }

  /*
  USER MESSAGE
  
  */
  /*
  LIKE
  
  */
  /*
  COMMENTS 
  
  */
  /*
  ACCOUNT STAFF
  
  */
  /*
  FOLLOW
  
  */
}
