import 'package:flutter/material.dart';

class OpacityAnimationScreen extends StatefulWidget {
  const OpacityAnimationScreen({super.key});

  @override
  State<OpacityAnimationScreen> createState() => _OpacityAnimationScreenState();
}

class _OpacityAnimationScreenState extends State<OpacityAnimationScreen> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opacity Animation "),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: isVisible ? 1.0 : 0.0,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue),
                child: Text(
                  isVisible ? "Hide" : "Show",
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO IMPLEMENT VISIBILITY ANIMATION
/// SIMPLE '
/// CLICK ON BUTTON HIDE AND SHOW BOX
///
/// complete
/// fine check
