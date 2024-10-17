import 'package:flutter/material.dart';
import 'package:pro/components_admin/task_management_card.dart';

class TaskManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example task count
        itemBuilder: (context, index) {
          return TaskManagementCard(
            taskTitle: 'Task #$index',
            taskDescription: 'Task description goes here',
            taskStatus: index % 2 == 0 ? 'Pending' : 'Completed',
          );
        },
      ),
    );
  }
}
