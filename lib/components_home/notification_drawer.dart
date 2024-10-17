import 'package:flutter/material.dart';

class NotificationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.assignment, color: Colors.blue),
                  title: Text('Task assigned: Ticket #152'),
                  subtitle: Text('Assigned to John Doe at 10:00 AM'),
                ),
                ListTile(
                  leading: Icon(Icons.assignment, color: Colors.blue),
                  title: Text('Task completed: Ticket #141'),
                  subtitle: Text('Completed by Jane Smith at 1:30 PM'),
                ),
                ListTile(
                  leading: Icon(Icons.assignment, color: Colors.blue),
                  title: Text('New request submitted: Ticket #200'),
                  subtitle: Text('Submitted by Space Dept. at 3:15 PM'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
