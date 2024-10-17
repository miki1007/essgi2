import 'package:flutter/material.dart';
import 'package:pro/components_admin/user_management_card.dart';

class UserManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example user count
        itemBuilder: (context, index) {
          return UserManagementCard(
            userName: 'User #$index',
            userRole: index % 2 == 0 ? 'Technician' : 'Admin',
          );
        },
      ),
    );
  }
}
