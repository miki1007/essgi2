import 'package:flutter/material.dart';

class AdminStatsOverview extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final int totalUsers;
  final int activeTechnicians;

  const AdminStatsOverview({
    Key? key,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.totalUsers,
    required this.activeTechnicians,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Total Tasks: $totalTasks'),
        Text('Completed Tasks: $completedTasks'),
        Text('Pending Tasks: $pendingTasks'),
        Text('Total Users: $totalUsers'),
        Text('Active Technicians: $activeTechnicians'),
        // Add more stats widgets as needed
      ],
    );
  }
}
