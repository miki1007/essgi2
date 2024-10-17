import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String ticketNumber;
  final String status;
  final String dateTime;
  final String address;
  final String technician;
  final String provider;

  TaskDetailPage({
    required this.ticketNumber,
    required this.status,
    required this.dateTime,
    required this.address,
    required this.technician,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Pending'
        ? Colors.orange
        : status == 'Cancelled'
            ? Colors.red
            : Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket #$ticketNumber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.build, size: 30, color: statusColor),
                SizedBox(width: 10),
                Text(
                  'Status: $status',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: statusColor),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Date & Time:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(dateTime,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Address:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(address,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Technician:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(technician,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Provider:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(provider,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
