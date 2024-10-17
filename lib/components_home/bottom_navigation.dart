import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: Colors.white, // Set a clear background color
      selectedItemColor: Colors.blue, // Highlight the selected item in blue
      unselectedItemColor: Colors.grey, // Use grey for unselected items
      showUnselectedLabels: true, // Show unselected item labels
      showSelectedLabels: true, // Show selected item labels
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/img/profile.jpeg'),
            radius: 12,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
