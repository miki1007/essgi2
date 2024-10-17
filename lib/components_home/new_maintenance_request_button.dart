import 'package:flutter/material.dart';

class NewMaintenanceRequestButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NewMaintenanceRequestButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          backgroundColor: Colors.blue,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 20, color: Colors.white),
            SizedBox(width: 8),
            Text('New Maintenance Request',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
