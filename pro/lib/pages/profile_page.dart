import 'package:flutter/material.dart';
import 'package:pro/Models/user.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/database/database_provider.dart';
import 'package:provider/provider.dart';

/*
   PROFILE PAGE

   This is a profile page for a given uid
 */
class ProfilePage extends StatefulWidget {
  //user id
  final String uid;

  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //providers
  late final DatabaseProvider databaseProvider;

  //user info
  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();

  //loading
  bool _isLoading = true;

  //controllers for text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  //on startup
  @override
  void initState() {
    super.initState();
    databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    loadUser();
  }

  Future<void> loadUser() async {
    //get user profile info
    user = await databaseProvider.userProfile(widget.uid);

    //populate text fields with user data
    if (user != null) {
      _nameController.text = user!.name;
      _emailController.text = user!.email;
    }

    //finished loading
    setState(() {
      _isLoading = false;
    });
  }

  // Update user profile method
  Future<void> _updateProfile() async {
    await databaseProvider.updateUserProfile(
      currentUserId,
      _nameController.text,
      _emailController.text,
      _phoneController.text,
    );
    loadUser(); // Reload user data after update
  }

  Future<void> _logout() async {
    await AuthService().logout();
    Navigator.pushReplacementNamed(context, '/login'); // Adjust as necessary
  }

  //BUILD UI
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD
    return Scaffold(
      // App Bar
      appBar: AppBar(
        title: Text(_isLoading || user == null ? 'Loading...' : 'Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Profile Picture
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Implement logic to change the profile picture
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Editable Fields
                  _buildTextField('Name', _nameController),
                  _buildTextField('Email', _emailController),
                  _buildTextField('Phone Number', _phoneController),
                  const SizedBox(height: 20),

                  // Update Button
                  ElevatedButton(
                    onPressed: _updateProfile,
                    child: const Text('Update Profile'),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
