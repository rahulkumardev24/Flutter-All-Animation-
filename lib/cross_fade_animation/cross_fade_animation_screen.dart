import 'package:flutter/material.dart';

class CrossFadeAnimationScreen extends StatefulWidget {
  const CrossFadeAnimationScreen({super.key});

  @override
  State<CrossFadeAnimationScreen> createState() =>
      _FadeCrossAnimationScreenState();
}

class _FadeCrossAnimationScreenState extends State<CrossFadeAnimationScreen> {
  bool isFirstVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cross Fade Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              /// first child
              firstChild: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade200,
                    borderRadius: BorderRadius.circular(10)),
              ),

              /// second child
              secondChild: Container(
                height: 310,
                width: 310,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/girlimage.jpg"),
                        fit: BoxFit.cover)),
              ),
              crossFadeState: isFirstVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 3),
              firstCurve: Curves.easeInQuad,
              secondCurve: Curves.easeIn,
            ),

            const SizedBox(
              height: 30,
            ),

            /// ------------------------ button -----------------------------
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFirstVisible = !isFirstVisible;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.deepOrange),
                  child: Text(
                    isFirstVisible ? "Face Reveal" : " Hide",
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO WE IMPLEMENT CROSS FADE ANIMATION
/// SIMPLE STEP
/// final check
/// thanks
