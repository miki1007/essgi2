import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro/firebase_options.dart';
import 'package:pro/pages/auth_get.dart'; // Import AuthGet
import 'package:pro/services/database/database_provider.dart';
import 'package:pro/theme/themeProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  // Firebase Setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      // Theme Provider
      ChangeNotifierProvider(
        create: (context) => Themeprovider(),
      ),
      // Database Provider
      ChangeNotifierProvider(
        create: (context) => DatabaseProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current theme data from the provider
    final themeProvider = Provider.of<Themeprovider>(context);

    return MaterialApp(
      title: 'Maintenance Tracker',
      theme: themeProvider.themeData, // Apply theme from provider
      home: AuthGet(
          toggleTheme:
              themeProvider.toggleTheme), // Pass toggleTheme to AuthGet
      debugShowCheckedModeBanner: false, // Disable the debug banner
    );
  }
}
