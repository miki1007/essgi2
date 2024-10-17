import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String name;
  final String email;
  final String username;
  final String bio;
  final String role; // Add role here

  UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    required this.username,
    this.bio = '',
    required this.role, // Role is required
  });

  // Convert to map to save in Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'username': username,
      'bio': bio,
      'role': role, // Include role in the map
    };
  }

  // Create UserProfile from Firestore document
  factory UserProfile.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserProfile(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      bio: data['bio'] ?? '',
      role: data['role'] ?? 'user', // Default role to 'user' if missing
    );
  }
}
