import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final VoidCallback onCloseSearch;

  const SearchBarComponent({
    Key? key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onCloseSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search services...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: onCloseSearch,
            ),
          ],
        ),
      ),
    );
  }
}
