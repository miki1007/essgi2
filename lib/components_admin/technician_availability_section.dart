import 'package:flutter/material.dart';

class TechnicianAvailabilitySection extends StatelessWidget {
  final List<Map<String, String>> technicians;

  TechnicianAvailabilitySection({
    Key? key,
    required this.technicians,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: technicians.length,
      itemBuilder: (context, index) {
        final technician = technicians[index];
        final name = technician['name'];
        final status = technician['status'];

        return ListTile(
          title: Text(name ?? 'Unknown'),
          subtitle: Text(status ?? 'Status unknown'),
          leading: Icon(
            status == 'Available' ? Icons.check_circle : Icons.cancel,
            color: status == 'Available' ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }
}
