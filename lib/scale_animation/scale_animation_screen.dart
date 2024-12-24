import 'package:flutter/material.dart';

class ScaleAnimationScreen extends StatefulWidget {
  const ScaleAnimationScreen({super.key});

  @override
  State<ScaleAnimationScreen> createState() => _ScaleAnimationScreenState();
}

class _ScaleAnimationScreenState extends State<ScaleAnimationScreen> {
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scale Animation Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _scale = _scale == 1.0 ? 3.0 : 1.0;
                });
              },
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(seconds: 3),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/images/girlimage.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO WE IMPLEMENT
/// SCALE ANIMATION
/// SIZED OF THE BOX INCREASE AND DECREASE CLICK ON BOX
/// final check
