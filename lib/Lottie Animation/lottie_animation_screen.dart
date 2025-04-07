import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationScreen extends StatefulWidget {
  const LottieAnimationScreen({super.key});

  @override
  State<LottieAnimationScreen> createState() => _LottieAnimationScreenState();
}

class _LottieAnimationScreenState extends State<LottieAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Animation"),
      ),
      body: Center(
        child: Lottie.asset("assets/lottie/Animation - 1735470791197.json",
            height: 300, width: 300 ,fit: BoxFit.contain),
      ),
    );
  }
}

/// in this video we implement LOTTIE Animation
/// VERY SIMPLE
///
/// in the next video we control the animation with animation controller
