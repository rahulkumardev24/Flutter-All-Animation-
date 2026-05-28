import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:haptic_kit/haptic_kit.dart';

class HapticKitAnimation extends StatefulWidget {
  const HapticKitAnimation({super.key});

  @override
  State<HapticKitAnimation> createState() => _HapticKitAnimationState();
}

class _HapticKitAnimationState extends State<HapticKitAnimation>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _waveController;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  Future<void> _startExperience() async {
    if (_isPlaying) return;

    _isPlaying = true;

    // 1. Small tap feedback
    await Haptics.selection();
    await _pulseController.forward();

    await Future.delayed(const Duration(milliseconds: 120));

    // 2. Medium impact
    _pulseController.reset();
    await Haptics.impact(HapticImpactStyle.medium);
    await _pulseController.forward();

    await Future.delayed(const Duration(milliseconds: 150));

    // 3. Success feedback
    await Haptics.notification(HapticNotificationStyle.success);

    // 4. Run waveform animation
    _waveController.repeat();

    // 5. Custom waveform vibration
    await Vibration.vibrateWaveform(
      timings: const [
        Duration.zero,
        Duration(milliseconds: 100),
        Duration(milliseconds: 100),
        Duration(milliseconds: 100),
        Duration(milliseconds: 100),
        Duration(milliseconds: 100),
      ],
      amplitudes: const [0, 80, 0, 160, 0, 255],
    );

    await Future.delayed(const Duration(milliseconds: 1500));

    // 6. Final OS effect
    await Vibration.playPredefined(
      PredefinedEffect.doubleClick,
    );

    _waveController.stop();
    _waveController.reset();

    _pulseController.reverse();

    _isPlaying = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _pulseController,
            _waveController,
          ]),
          builder: (context, child) {
            final pulseScale =
                1 + (_pulseController.value * 0.18);

            return Stack(
              alignment: Alignment.center,
              children: [
                // Animated wave rings
                ...List.generate(3, (index) {
                  final progress =
                      (_waveController.value + (index * 0.25)) % 1;

                  final opacity = (1 - progress).clamp(0.0, 1.0);

                  final scale = 1 + (progress * 2);

                  return Opacity(
                    opacity: opacity * 0.4,
                    child: Transform.scale(
                      scale: scale,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                // Main glowing button
                Transform.scale(
                  scale: pulseScale,
                  child: GestureDetector(
                    onTap: _startExperience,
                    child: Container(
                      width: size.width * 0.32,
                      height: size.width * 0.32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff60A5FA),
                            Color(0xff2563EB),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.45),
                            blurRadius: 30,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.touch_app_rounded,
                        color: Colors.white,
                        size: 46,
                      ),
                    ),
                  ),
                ),

                // Floating particles
                ...List.generate(10, (index) {
                  final angle = (index / 10) * math.pi * 2;

                  final radius =
                      90 + (_waveController.value * 50);

                  final dx = math.cos(angle) * radius;
                  final dy = math.sin(angle) * radius;

                  return Transform.translate(
                    offset: Offset(dx, dy),
                    child: Opacity(
                      opacity:
                      (1 - _waveController.value).clamp(0, 1),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Tap the circle to feel haptics + animation',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}