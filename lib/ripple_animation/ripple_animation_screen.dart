import 'package:flutter/material.dart';

class RippleAnimationScreen extends StatefulWidget {
  const RippleAnimationScreen({super.key});

  @override
  State<RippleAnimationScreen> createState() => _RippleAnimationScreenState();
}

class _RippleAnimationScreenState extends State<RippleAnimationScreen>
    with SingleTickerProviderStateMixin {
      late AnimationController animationController;
  var radiusList = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 3), lowerBound: 0.4);
    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ripple Animation",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        /// body
      ),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          ...radiusList.map((radius) {
            final scale = animationController.value;
            final int alphaValue = ((1.0 - scale) * 255).toInt().clamp(0, 255);
            return Container(
              width: radius * animationController.value,
              height: radius * animationController.value,
              decoration: BoxDecoration(
                color: Colors.deepOrange.withAlpha(alphaValue),
                shape: BoxShape.circle,
              ),
            );
          }).toList(),
          ClipOval(
            child: Image.asset(
              "assets/images/profile.jpg",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          )
        ]),
      ),
    );
  }
}

/// IN THIS VIDE WE IMPLEMENT RIPPLE ANIMATION
/// Thanks For watching
/// 
