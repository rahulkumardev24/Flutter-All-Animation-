import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationControlScreen extends StatefulWidget {
  const LottieAnimationControlScreen({super.key});

  @override
  State<LottieAnimationControlScreen> createState() =>
      _LottieAnimationControlScreenState();
}

class _LottieAnimationControlScreenState
    extends State<LottieAnimationControlScreen>
    with SingleTickerProviderStateMixin {
  /// here we create animation controller
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    /// control the duration of animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animation Control Scareen"),
      ),
      body: Center(
        child: Column(
          children: [
            /// lottie files
            Lottie.asset("assets/lottie/GIFTBOX.json",
                controller: animationController),

            /// control the animation with this button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    animationController!.repeat(reverse: true);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.orange),
                  child: const Text(
                    "Open Gift",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO WE IMPLEMENT LOTTIE ANIMATION '
/// LOTTIE ANIMATION CONTROL ALSO '
/// FIRST IMPLEMENT LOTTIE ANIMATION
/// COMPLETE
/// CHECK
