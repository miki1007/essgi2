import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Get instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get the current user
  User? getCurrentUser() => _auth.currentUser;

  // Get current user UID
  String getCurrentUid() => _auth.currentUser?.uid ?? '';

  // Login with email and password
  Future<UserCredential> loginEmailPassword(
      String email, String password) async {
    try {
      // Try to login the user
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      throw Exception('Failed to login: ${e.message}');
    } catch (e) {
      // Catch any other error
      throw Exception('An unknown error occurred: $e');
    }
  }

  // Register with email and password
  Future<UserCredential> registerEmailPassword(
      String email, String password) async {
    try {
      // Try to register the user
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle registration errors
      if (e.code == 'email-already-in-use') {
        throw Exception(
            'The email address is already in use by another account.');
      } else if (e.code == 'weak-password') {
        throw Exception('The password is too weak.');
      } else {
        throw Exception('Failed to register: ${e.message}');
      }
    } catch (e) {
      // Catch any other error
      throw Exception('An unknown error occurred: $e');
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }

  // Delete user account
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw Exception('Please login again to delete your account.');
      } else {
        throw Exception('Failed to delete account: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  // Send email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw Exception('Failed to send verification email: $e');
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }

  // Track authentication state
  Stream<User?> authStateChanges() => _auth.authStateChanges();
}
