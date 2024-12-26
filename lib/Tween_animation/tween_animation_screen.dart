import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  /// for height and width
  Animation<double>? heightWidthAnimation;

  /// for color
  Animation<Color?>? colorAnimation;

  /// for border radius
  Animation<double>? borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    /// height and width animation ,,, begin mens start height // with , end means end width .// height
    heightWidthAnimation = Tween<double>(
      begin: 100,
      end: 300,
    ).animate(animationController!);

    /// for color
    colorAnimation =
        ColorTween(begin: Colors.greenAccent, end: Colors.deepPurple)
            .animate(animationController!);

    /// for border radius
    borderRadiusAnimation =
        Tween<double>(begin: 2.0, end: 90.0).animate(animationController!);

    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tween Animation"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: heightWidthAnimation!.value,
              height: heightWidthAnimation!.value,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    animationController!.repeat(reverse: true);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blueAccent),
                  child: const Text(
                    "Start",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  )),
            ),

            const SizedBox(
              height: 50,
            ),

            /// height /// width with color

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: colorAnimation!.value,
                  borderRadius: BorderRadius.circular(10)),
            ),

            const SizedBox(
              height: 50,
            ),

            /// for border radius
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius:
                      BorderRadius.circular(borderRadiusAnimation!.value)),
            ),
          ],
        ),
      )),
    );
  }
}

/// in this video we implement TWEEN Animation
/// Tween All Animation
/// like , height , width , size , color , border radius ....... etc
/// simple
/// step flow
/// final check
