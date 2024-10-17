import 'package:flutter/material.dart';
import 'package:pro/components_home/booking_confirmation_card.dart';
import 'package:pro/components_home/categories_section.dart';
import 'package:pro/components_home/home_page_header.dart';
import 'package:pro/components_home/new_maintenance_request_button.dart';
import 'package:pro/components_home/search_bar_component.dart';
import 'package:pro/components_home/technician_availability_section.dart';
import 'package:pro/pages/bookings_page.dart'; // Bookings Page
import 'package:pro/pages/chat_page.dart'; // Chat Page
import 'package:pro/pages/profile_page.dart'; // Profile Page

class UserDashboardPage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const UserDashboardPage(
      {Key? key, required this.toggleTheme, required String uid})
      : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> _technicians = [
    {'name': 'Technician A', 'status': 'Available'},
    {'name': 'Technician B', 'status': 'Busy'},
  ];
  bool _showAllTechnicians = false;
  int _selectedIndex = 0;

  // Function to handle bottom navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to show the notification drawer
  void _showNotificationDrawer() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 300, // Adjust height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blue),
                      title: Text('Task assigned: Ticket #152'),
                      subtitle: Text('Assigned to John Doe at 10:00 AM'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blue),
                      title: Text('Task completed: Ticket #141'),
                      subtitle: Text('Completed by Jane Smith at 1:30 PM'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blue),
                      title: Text('New request submitted: Ticket #200'),
                      subtitle: Text('Submitted by Space Dept. at 3:15 PM'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to show the new maintenance request form
  void _showRequestForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Maintenance Request'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomePageHeader(
                  toggleTheme: widget.toggleTheme,
                  onNotificationPressed: _showNotificationDrawer,
                ),
                SearchBarComponent(
                  searchController: searchController,
                  onSearchChanged: (query) {},
                  onCloseSearch: () {},
                ),
                BookingConfirmationCard(
                  onClose: () {},
                ),
                CategoriesSection(
                  onCategorySelected: (label) {},
                ),
                TechnicianAvailabilitySection(
                  technicians: _technicians,
                  showAllTechnicians: _showAllTechnicians,
                  onShowAllTechniciansPressed: () {
                    setState(() {
                      _showAllTechnicians = !_showAllTechnicians;
                    });
                  },
                ),
                NewMaintenanceRequestButton(
                  onPressed: _showRequestForm,
                ),
              ],
            ),
          ),
          BookingsPage(),
          ChatPage(),
          ProfilePage(uid: '', toggleTheme: widget.toggleTheme),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set background color
        elevation: 20, // Higher elevation for better visibility
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue.shade900, // Darker selected color
        unselectedItemColor:
            Colors.grey.shade600, // More visible unselected color
        selectedFontSize: 14, // Bigger font for selected item
        unselectedFontSize: 12, // Slightly smaller font for unselected items
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold), // Bolder selected text
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
      ),
    );
  }
}
