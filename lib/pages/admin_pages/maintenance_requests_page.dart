import 'package:flutter/material.dart';
import 'package:pro/components_admin/maintenance_overview_section.dart';

class MaintenanceRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance Requests'),
      ),
      body: MaintenanceOverviewSection(), // List all maintenance requests
    );
  }
}
