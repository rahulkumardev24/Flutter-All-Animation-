import 'package:flutter/material.dart';

class IconAnimationScreen extends StatefulWidget {
  const IconAnimationScreen({super.key});

  @override
  State<IconAnimationScreen> createState() => _IconAnimationScreenState();
}

class _IconAnimationScreenState extends State<IconAnimationScreen>
    with SingleTickerProviderStateMixin {
  /// animation controller
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: animationController,
                  size: 100,
                )),
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO IMPLEMENT ICON ANIMATION
/// SIMPLE
/// FINAL CHECK
