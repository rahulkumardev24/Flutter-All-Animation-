import 'package:flutter/material.dart';

class HeroAnimationDetails extends StatefulWidget {
  final String Image;
  final String name;
  final String age;
  final String tag;

  HeroAnimationDetails({
    super.key,
    required this.Image,
    required this.name,
    required this.age,
    required this.tag,
  });

  @override
  State<HeroAnimationDetails> createState() => _HeroAnimationDetailsState();
}

class _HeroAnimationDetailsState extends State<HeroAnimationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// SECOND // DETAILS SCREEN =>
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),

      /// Wrap content with SingleChildScrollView for scrollable behavior
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.tag,
              child: Image.asset(
                widget.Image,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.age,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// THIS IS DETAILS SCREEN
