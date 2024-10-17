import 'package:flutter/material.dart';

class SharedHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onNotificationPressed;
  final VoidCallback onToggleTheme;

  const SharedHeader({
    Key? key,
    required this.onNotificationPressed,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Admin Portal'),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: onNotificationPressed,
        ),
        IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: onToggleTheme,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
