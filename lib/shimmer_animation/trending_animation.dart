import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingAnimation extends StatefulWidget {
  const TrendingAnimation({super.key});

  @override
  State<TrendingAnimation> createState() => _TrendingAnimationState();
}

class _TrendingAnimationState extends State<TrendingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Shimmer.fromColors(
            baseColor: const Color(0xfff6a95a),
            highlightColor: const Color(0xfffa2868),
            child: const Text(
              "Trending Now",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
