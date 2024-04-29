
import 'package:flutter/material.dart';
import 'package:vertical_videos_avm/screens/revelare_screen.dart';
import 'package:vertical_videos_avm/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical videos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const RevelareScreen()
    );
  }
}