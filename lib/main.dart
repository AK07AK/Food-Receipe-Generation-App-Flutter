import 'package:ai_assistant/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'constants/app_theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: lightTheme,
    );
  }
}
