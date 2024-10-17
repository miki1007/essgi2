import 'package:flutter/material.dart';

class UserManagementCard extends StatelessWidget {
  final String userName;
  final String userRole;

  UserManagementCard({
    required this.userName,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Role: $userRole'),
              ],
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Edit user details
              },
            ),
          ],
        ),
      ),
    );
  }
}
