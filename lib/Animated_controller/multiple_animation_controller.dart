import 'package:flutter/material.dart';

class MultipleAnimationController extends StatefulWidget {
  const MultipleAnimationController({super.key});

  @override
  State<MultipleAnimationController> createState() =>
      _MultipleAnimationControllerState();
}

class _MultipleAnimationControllerState

    /// only one Controller then use SingleTickerProviderStateMixin
    /// Multiple Controller then use TickerProviderStateMixin
    /// here we have create multiple controller
    extends State<MultipleAnimationController> with TickerProviderStateMixin {
  /// FIRST ANIMATION CONTROLLER
  AnimationController? animationController;

  /// SECOND ANIMATION CONTROLLER
  AnimationController? animationControllerSecond;
  Animation<double>? heightWidthAnimation;
  Animation<Size?>? sizeAnimation;
  Animation<Color?>? colorAnimation;
  @override
  void initState() {
    super.initState();

    /// FIRS ANIMATION CONTROLLER
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController!.addListener(
      () {
        setState(() {});
      },
    );
    heightWidthAnimation =
        Tween<double>(begin: 100, end: 200).animate(animationController!);
    sizeAnimation =
        SizeTween(begin: Size(300.0, 100.0), end: Size(100.0, 300.0))
            .animate(animationController!);
    colorAnimation = ColorTween(begin: Colors.greenAccent, end: Colors.red)
        .animate(animationController!);

    /// second Animation Controller
    animationControllerSecond =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              /// here we add then we required second animation is start between the first animation
              if (animationControllerSecond!.value >= 0.5) {
                animationController!.forward();
              }
            });
          })
          ..addStatusListener((status) {
            /// first animation is ebd then send start
            /*  if(status == AnimationStatus.completed){
        animationController!.forward();

      }*/
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Animation Controller "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sizeAnimation!.value!.width,
              width: sizeAnimation!.value!.height,
              decoration: BoxDecoration(color: colorAnimation!.value),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.orange,
                        side: const BorderSide(width: 2, color: Colors.red)),
                    onPressed: () {
                      animationControllerSecond!.forward();
                    },
                    child: const Text(
                      "Start",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
