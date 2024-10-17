import 'package:flutter/material.dart';

class AdminSideNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Admin Navigation'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              // Navigate to Dashboard
            },
          ),
          ListTile(
            title: Text('Technicians Overview'),
            onTap: () {
              // Navigate to Technicians Overview
            },
          ),
          ListTile(
            title: Text('User Management'),
            onTap: () {
              // Navigate to User Management
            },
          ),
          // Add more navigation items as needed
        ],
      ),
    );
  }
}
