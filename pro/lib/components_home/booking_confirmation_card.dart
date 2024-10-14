import 'package:flutter/material.dart';

class BookingConfirmationCard extends StatelessWidget {
  final VoidCallback onClose;

  const BookingConfirmationCard({Key? key, required this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.purple.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.check_circle_outline, color: Colors.white),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your booking is confirmed.',
                      style: TextStyle(color: Colors.white)),
                  Text('Filter Replacement',
                      style: TextStyle(color: Colors.white)),
                  Text('October 10, 2024 1:59 PM',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
