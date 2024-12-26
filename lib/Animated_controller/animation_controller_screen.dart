import 'package:flutter/material.dart';

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Controller"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300 * animationController!.value,
              height: 300 * animationController!.value,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      animationController!.repeat(reverse: true);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Start",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )))
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO WE IMPLEMENT ANIMATION CONTROLLER
/// SIMPLE
/// in next we implement more fetcher of animation controller
