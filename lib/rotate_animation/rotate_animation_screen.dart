import 'package:flutter/material.dart';

class RotateAnimationScreen extends StatefulWidget {
  const RotateAnimationScreen({super.key});

  @override
  State<RotateAnimationScreen> createState() => _RotateAnimationScreenState();
}

class _RotateAnimationScreenState extends State<RotateAnimationScreen> {
  double numRotate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rotate Animation"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: numRotate,
              duration: const Duration(seconds: 8),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,

              /// when click on button rotate the box
              /// you can change the number of rotate count
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numRotate += 5;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.red),
                  child: const Text(
                    "Rotate",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/// in this video implement  Rotate Animation
/// simple rotate animation
/// final check
