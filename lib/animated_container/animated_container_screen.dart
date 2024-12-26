import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double wHeight = 150;
  double wWidth = 150;
  Color mColor = Colors.red;
  double mRadius = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
          child: InkWell(
        onTap: () {
          setState(() {
            wWidth = wWidth == 150 ? 300 : 150;
            wHeight = wHeight == 150 ? 300 : 150;
            mColor = mColor == Colors.red
                ? Colors
                    .primaries[Random().nextInt(Colors.primaries.length - 1)]
                : Colors.red;
            mRadius =
                mRadius == 2 ? Random().nextInt(100).toDouble() : mRadius = 2;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: wHeight,
          width: wWidth,
          decoration: BoxDecoration(
              color: mColor, borderRadius: BorderRadius.circular(mRadius)),
        ),
      )),
    );
  }
}

/// IN THIS VIDEO WE IMPLEMENT ANIMATED CONTAINER
/// SIMPLE
/// HEIGHT ,
/// WIDTH , => change
/// COLOR , => change
/// BORDER RADIUS => change
///
/// check compete code
