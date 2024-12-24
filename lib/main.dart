import 'package:flutter/material.dart';
import 'package:flutter_all_animation/Opacity_animation/opacity_animation_screen.dart';
import 'package:flutter_all_animation/align_animation/align_animation_screen.dart';
import 'package:flutter_all_animation/cross_fade_animation/cross_fade_animation_screen.dart';
import 'package:flutter_all_animation/rotate_animation/rotate_animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CrossFadeAnimationScreen(),
    );
  }
}

