import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Map<String, String?> task;
  final VoidCallback onTap;

  TaskCard({required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ticketNumber = task["ticketNumber"] ?? 'Unknown Ticket Number';
    final status = task["status"] ?? 'Unknown Status';
    final dateTime = task["dateTime"] ?? 'Unknown Date/Time';
    final address = task["address"] ?? 'Unknown Address';
    final technician = task["technician"] ?? 'Unknown Technician';
    final provider = task["provider"] ?? 'Unknown Provider';

    final statusColor = status == 'Pending'
        ? Colors.orange
        : status == 'Cancelled'
            ? Colors.red
            : Colors.green;

    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.only(bottom: 20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.build, size: 30, color: statusColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Ticket #$ticketNumber - $status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
              Divider(height: 20, color: Colors.grey.shade300),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date & Time:',
                          style: TextStyle(color: Colors.grey)),
                      Text(dateTime,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Provider:', style: TextStyle(color: Colors.grey)),
                      Text(provider,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('Address: $address', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Technician: $technician', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
