import 'package:flutter/material.dart';

class AdminDashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome, Admin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Open settings or profile
            },
          ),
        ],
      ),
    );
  }
}
