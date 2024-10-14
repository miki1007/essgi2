import 'package:flutter/material.dart';

class TechnicianAvailabilitySection extends StatelessWidget {
  final List<Map<String, String>> technicians;
  final bool showAllTechnicians;
  final VoidCallback onShowAllTechniciansPressed;

  const TechnicianAvailabilitySection({
    Key? key,
    required this.technicians,
    required this.showAllTechnicians,
    required this.onShowAllTechniciansPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Technician Availability',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ListTile(
            title: Text(technicians[0]['name']!),
            subtitle: Text(technicians[0]['status']!),
            leading: Icon(
              technicians[0]['status'] == 'Available'
                  ? Icons.check_circle
                  : Icons.cancel,
              color: technicians[0]['status'] == 'Available'
                  ? Colors.green
                  : Colors.red,
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: onShowAllTechniciansPressed,
            ),
          ),
          if (showAllTechnicians)
            ...technicians.skip(1).map((tech) => ListTile(
                  title: Text(tech['name']!),
                  subtitle: Text(tech['status']!),
                  leading: Icon(
                    tech['status'] == 'Available'
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: tech['status'] == 'Available'
                        ? Colors.green
                        : Colors.red,
                  ),
                ))
        ],
      ),
    );
  }
}
