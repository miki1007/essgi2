import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  final VoidCallback toggleTheme;
  final VoidCallback onNotificationPressed;

  const HomePageHeader({
    Key? key,
    required this.toggleTheme,
    required this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/ongoing.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: onNotificationPressed,
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.dark_mode, color: Colors.white),
                  onPressed: toggleTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
