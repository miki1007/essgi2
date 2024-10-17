import 'package:flutter/material.dart';

class TaskManagementCard extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String taskStatus;

  TaskManagementCard({
    required this.taskTitle,
    required this.taskDescription,
    required this.taskStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(taskDescription),
            Text('Status: $taskStatus'),
          ],
        ),
      ),
    );
  }
}
