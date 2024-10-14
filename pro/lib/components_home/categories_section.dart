import 'package:flutter/material.dart';
import 'package:pro/pages/completed_tasks_page.dart';
import 'package:pro/pages/ongoing_tasks_page.dart';
import 'package:pro/pages/overall_efficiency_page.dart';
import 'package:pro/pages/pending_tasks_page.dart'; // Import your pages

class CategoriesSection extends StatelessWidget {
  const CategoriesSection(
      {Key? key, required Null Function(dynamic label) onCategorySelected})
      : super(key: key);

  // Function to navigate to the selected category page
  void _navigateToCategoryPage(BuildContext context, String label) {
    switch (label) {
      case 'Pending Tasks':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PendingTasksPage()),
        );
        break;
      case 'Overall Efficiency':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OverallEfficiencyPage()),
        );
        break;
      case 'Ongoing Tasks':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OngoingTasksPage()),
        );
        break;
      case 'Completed Tasks':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompletedTasksPage()),
        );
        break;
      default:
        // Handle default case or unknown categories
        break;
    }
  }

  Widget _buildCategoryButton(
      String label, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _navigateToCategoryPage(context, label),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade100,
              child: Icon(icon, size: 30, color: Colors.blue),
            ),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryButton(
                    'Pending Tasks', Icons.hourglass_empty, context),
                _buildCategoryButton(
                    'Overall Efficiency', Icons.assessment, context),
                _buildCategoryButton(
                    'Ongoing Tasks', Icons.play_circle, context),
                _buildCategoryButton(
                    'Completed Tasks', Icons.check_circle, context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
