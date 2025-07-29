import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/theme/app_theme.dart';
import 'features/swipe/presentation/pages/swipe_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    const ProviderScope(
      child: PropertySwipeApp(),
    ),
  );
}

class PropertySwipeApp extends StatelessWidget {
  const PropertySwipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PropertySwipe',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // For now, start with the swipe page as the home
      // Later this will be replaced with proper routing and authentication
      home: const SwipePage(),
    );
  }
}