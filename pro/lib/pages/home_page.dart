// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pro/component/my_drawer.dart'; // Your custom drawer

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State for Quick Actions buttons
  Map<String, bool> _quickActionStates = {
    'New Request': false,
    'View History': false,
    'Check Status': false,
  };

  @override
  Widget build(BuildContext context) {
    // Responsive layout
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Maintenance Dashboard'),
        foregroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Open notifications page or dialog
              _showNotifications();
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Text(
              'Welcome to ESSGI Maintenance System',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 10),

            // Dashboard Overview with Horizontal Scrolling
            _buildDashboardOverview(),

            const SizedBox(height: 20),

            // Quick Actions
            _buildQuickActions(),

            const SizedBox(height: 20),

            // Technician Availability
            _buildTechnicianAvailability(),
          ],
        ),
      ),
    );
  }

  // Dashboard Overview Section with Horizontal Scrolling
  Widget _buildDashboardOverview() {
    final List<Map<String, dynamic>> dashboardItems = [
      {
        'title': 'Ongoing Requests',
        'icon': Icons.build,
        'image': 'assets/img/ongoing.jpeg'
      },
      {
        'title': 'Completed Tasks',
        'icon': Icons.done,
        'image': 'assets/img/completed.jpeg'
      },
      {
        'title': 'Pending Tasks',
        'icon': Icons.pending,
        'image': 'assets/img/pending.jpeg'
      },
      {
        'title': 'Overall Efficiency',
        'icon': Icons.timeline,
        'image': 'assets/img/overall.jpeg'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard Overview',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220, // Adjust height as needed for larger boxes
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dashboardItems.length,
            itemBuilder: (context, index) {
              final item = dashboardItems[index];
              return _buildCard(
                item['title'],
                item['icon'],
                item['image'], // Pass the image file path
              );
            },
          ),
        ),
      ],
    );
  }

  // Quick Actions Section with Button Color Change
  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton('New Request', Icons.add_circle_outline, () {
              // Navigate to New Request Page
              Navigator.pushNamed(context, '/new-request');
            }),
            _buildActionButton('View History', Icons.history, () {
              // Navigate to View History Page
              Navigator.pushNamed(context, '/history');
            }),
            _buildActionButton('Check Status', Icons.assignment_turned_in, () {
              // Navigate to Status Page
              Navigator.pushNamed(context, '/status');
            }),
          ],
        ),
      ],
    );
  }

  // Technician Availability Section
  Widget _buildTechnicianAvailability() {
    final List<Map<String, String>> technicians = [
      {'name': 'Technician A', 'status': 'Available'},
      {'name': 'Technician B', 'status': 'Busy'},
      {'name': 'Technician C', 'status': 'Available'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technician Availability',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: technicians.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final tech = technicians[index];
            return ListTile(
              leading: Icon(
                tech['status'] == 'Available'
                    ? Icons.check_circle
                    : Icons.cancel,
                color:
                    tech['status'] == 'Available' ? Colors.green : Colors.red,
              ),
              title: Text(tech['name']!),
              subtitle: Text(tech['status']!),
            );
          },
        ),
      ],
    );
  }

  // Build Card for Dashboard Overview with Image Background
  Widget _buildCard(String title, IconData icon, String imagePath) {
    return Container(
      width: 180, // Adjust width for larger boxes
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Action Button Builder with Color Change
  Widget _buildActionButton(
      String title, IconData icon, VoidCallback onPressed) {
    bool isActive = _quickActionStates[title] ?? false;

    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _quickActionStates[title] = !isActive;
            });
            onPressed();
          },
          backgroundColor:
              isActive ? Colors.green : Theme.of(context).colorScheme.primary,
          child: Icon(icon),
        ),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }

  // Notifications Icon Button in AppBar opens this method
  void _showNotifications() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Recent Notifications'),
        content: SizedBox(
          width: double.maxFinite,
          child: _buildRecentNotifications(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  // Recent Notifications
  Widget _buildRecentNotifications() {
    final List<Map<String, String>> notifications = [
      {'message': 'Technician assigned to Task #152', 'time': '10 minutes ago'},
      {'message': 'Task #141 has been completed', 'time': '1 hour ago'},
      {
        'message': 'New request submitted by Space Dept.',
        'time': '3 hours ago'
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          leading: const Icon(Icons.notification_important, color: Colors.red),
          title: Text(notification['message']!),
          subtitle: Text(notification['time']!),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        );
      },
    );
  }
}
