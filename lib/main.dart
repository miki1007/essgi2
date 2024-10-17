import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro/firebase_options.dart';
import 'package:pro/pages/admin_pages/dashboard_page.dart'; // Admin dashboard page
import 'package:pro/pages/login_page.dart';
import 'package:pro/pages/user_dashboard_page.dart'; // User dashboard page
import 'package:pro/services/Auth/auth_get.dart';
import 'package:pro/services/database/database_provider.dart';
import 'package:pro/theme/themeProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Themeprovider()),
      ChangeNotifierProvider(create: (context) => DatabaseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);

    return MaterialApp(
      title: 'Maintenance Tracker',
      theme: themeProvider.themeData,
      home: AuthGet(
        toggleTheme: themeProvider.toggleTheme,
      ), // Ensure toggleTheme is passed
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(onTap: () {}),
        '/user_dashboard': (context) => UserDashboardPage(
              toggleTheme: themeProvider.toggleTheme,
              uid: 'user_id',
            ), // Ensure uid is passed
        '/admin_dashboard': (context) => AdminDashboardPage(
              toggleTheme: themeProvider.toggleTheme,
              uid: 'admin_id',
            ), // Ensure uid is passed
      },
    );
  }
}
