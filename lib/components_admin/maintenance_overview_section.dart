import 'package:flutter/material.dart';

class MaintenanceOverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulating the list of maintenance requests
    final List<Map<String, String>> maintenanceRequests = [
      {"title": "Request #1", "status": "Pending"},
      {"title": "Request #2", "status": "Completed"},
    ];

    return ListView.builder(
      itemCount: maintenanceRequests.length,
      itemBuilder: (context, index) {
        final request = maintenanceRequests[index];
        return ListTile(
          title: Text(request["title"] ?? "Unknown Request"),
          subtitle: Text('Status: ${request["status"]}'),
          onTap: () {
            // View details of the maintenance request
          },
        );
      },
    );
  }
}
