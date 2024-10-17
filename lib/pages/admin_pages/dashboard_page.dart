import 'package:flutter/material.dart';
import 'package:pro/components_admin/admin_side_navigation.dart';
import 'package:pro/components_admin/admin_stats_overview.dart';
import 'package:pro/shared_components/header.dart';

class AdminDashboardPage extends StatelessWidget {
  final String uid; // Add uid parameter
  final VoidCallback toggleTheme; // Add toggleTheme parameter

  const AdminDashboardPage(
      {Key? key, required this.uid, required this.toggleTheme})
      : super(key: key); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedHeader(
        onNotificationPressed: () {
          // Show admin notifications
        },
        onToggleTheme: toggleTheme, // Pass toggleTheme to header
      ),
      body: Row(
        children: [
          AdminSideNavigation(), // Admin side navigation bar
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AdminStatsOverview(
                    totalTasks: 100,
                    completedTasks: 80,
                    pendingTasks: 20,
                    totalUsers: 50,
                    activeTechnicians: 10,
                  ), // Displaying an overview of stats
                  // More components like recent activities, tasks, etc.
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
