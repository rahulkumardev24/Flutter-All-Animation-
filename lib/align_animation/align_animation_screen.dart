import 'package:flutter/material.dart';

class AlignAnimationScreen extends StatefulWidget {
  const AlignAnimationScreen({super.key});

  @override
  State<AlignAnimationScreen> createState() => _AlignAnimationScreenState();
}

class _AlignAnimationScreenState extends State<AlignAnimationScreen> {
  bool isRightAlign = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Align Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedAlign(
                alignment:
                    isRightAlign ? Alignment.centerRight : Alignment.centerLeft,
                duration: const Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isRightAlign = !isRightAlign ;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blue),
                  child: Text(
                    isRightAlign ? "Move to Left" : "Move to Right",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO IMPLEMENT ALIGN ANIMATION
/// MOVE THE BOX
/// RIGHT TO LEFT AND LEFT TO RIGHT
/// SIMPLE
/// check complete code
/// you can change the duration and speed of the box
