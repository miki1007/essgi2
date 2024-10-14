import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pro/components_bookings/task_card.dart'; // Import TaskCard component
import 'package:pro/components_bookings/task_detail_page.dart';
// ignore: unused_import
import 'package:pro/pages/task_detail_page.dart'; // Import TaskDetailPage component

class BookingsPage extends StatelessWidget {
  final List<Map<String, String?>> tasks = [
    {
      "ticketNumber": "001",
      "status": "Completed",
      "dateTime": "2024-10-08 10:00 AM",
      "address": "Science Building",
      "technician": null,
      "provider": "Mikias Bayle",
    },
    {
      "ticketNumber": "002",
      "status": "Pending",
      "dateTime": "2024-10-07 09:30 AM",
      "address": "Laboratory Hall",
      "technician": null,
      "provider": "Fikade Tibebe",
    },
    {
      "ticketNumber": "003",
      "status": "Cancelled",
      "dateTime": "2024-10-09 02:00 PM",
      "address": "Library Wing",
      "technician": null,
      "provider": "Bizuayew",
    },
    // More tasks...
  ];

  @override
  Widget build(BuildContext context) {
    // Assign random technician names (you can replace this with Firebase data later)
    final List<String> technicianNames = [
      "Mikias Bayle",
      "Fikade Tibebe",
      "Bizuayew",
      // More technicians...
    ];

    tasks.forEach((task) {
      task["technician"] =
          technicianNames[Random().nextInt(technicianNames.length)];
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back to the previous page
          },
        ),
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskCard(
                task: task,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(
                        ticketNumber: task['ticketNumber'] ?? '',
                        status: task['status'] ?? '',
                        dateTime: task['dateTime'] ?? '',
                        address: task['address'] ?? '',
                        technician: task['technician'] ?? '',
                        provider: task['provider'] ?? '',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
