import 'package:flutter/material.dart';

class AnimationBuilderPart1 extends StatefulWidget {
  const AnimationBuilderPart1({super.key});

  @override
  State<AnimationBuilderPart1> createState() => _AnimationBuilderPart1State();
}

class _AnimationBuilderPart1State extends State<AnimationBuilderPart1>
    with SingleTickerProviderStateMixin {
  /// here we Create Animation controller
  AnimationController? animationController;
  Animation<Size?>? animationSize;
  // you can also create animation for , border color , ect ....

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController!.addListener(() {
      setState(() {});
    });

    /// here we create a size animation
    animationSize = SizeTween(begin: Size(200, 100), end: Size(100, 200))
        .animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Builder"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animationController!,
                child: Container(
                  height: animationSize!.value!.height,
                  width: animationSize!.value!.width,
                  decoration: BoxDecoration(color: Colors.orange),
                ),
                builder: (context, child) {
                  return child!;
                }),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      animationController!.repeat(reverse: true);
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(fontSize: 25),
                    )))
          ],
        ),
      ),
    );
  }
}

/// in this video we implement Animation Builder
/// in simple step
/// done
