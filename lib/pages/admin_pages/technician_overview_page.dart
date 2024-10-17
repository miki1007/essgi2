import 'package:flutter/material.dart';
import 'package:pro/components_admin/technician_availability_section.dart';

class TechnicianOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technician Overview'),
      ),
      body: TechnicianAvailabilitySection(
        technicians: [],
      ), // List all technicians
    );
  }
}
