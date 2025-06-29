import 'package:flutter/material.dart';
import 'package:flutter_all_animation/Animated_controller/animation_controller_screen.dart';
import 'package:flutter_all_animation/Animated_controller/multiple_animation_controller.dart';
import 'package:flutter_all_animation/Lottie%20Animation/lottie_animation_control_screen.dart';
import 'package:flutter_all_animation/Lottie%20Animation/lottie_animation_screen.dart';
import 'package:flutter_all_animation/Opacity_animation/opacity_animation_screen.dart';
import 'package:flutter_all_animation/Tween_animation/tween_animation_screen.dart';
import 'package:flutter_all_animation/align_animation/align_animation_screen.dart';
import 'package:flutter_all_animation/animated_container/animated_container_screen.dart';
import 'package:flutter_all_animation/animation_Builder/animation_builder_part_1.dart';
import 'package:flutter_all_animation/cross_fade_animation/cross_fade_animation_screen.dart';
import 'package:flutter_all_animation/grid_animation/grid_animation_screen.dart';
import 'package:flutter_all_animation/hero_animation/hero_animation_screen_first.dart';
import 'package:flutter_all_animation/icon_animation/icon_animation_screen.dart';
import 'package:flutter_all_animation/ripple_animation/ripple_animation_screen.dart';
import 'package:flutter_all_animation/rotate_animation/rotate_animation_screen.dart';
import 'package:flutter_all_animation/scale_animation/scale_animation_screen.dart';
import 'package:flutter_all_animation/shimmer_animation/shimmer_loading_screen.dart';
import 'package:flutter_all_animation/shimmer_animation/trending_animation.dart';

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
      home: ShimmerLoadingScreen(),
    );
  }
}
