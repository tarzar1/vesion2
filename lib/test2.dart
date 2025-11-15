import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const AnimatedRadialGradientApp());
}

class AnimatedRadialGradientApp extends StatelessWidget {
  const AnimatedRadialGradientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AnimatedRadialGradientContainer(),
        ),
      ),
    );
  }
}

class AnimatedRadialGradientContainer extends StatefulWidget {
  const AnimatedRadialGradientContainer({super.key});

  @override
  State<AnimatedRadialGradientContainer> createState() =>
      _AnimatedRadialGradientContainerState();
}

class _AnimatedRadialGradientContainerState
    extends State<AnimatedRadialGradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(); // 🔁 Hace que el gradiente gire sin parar
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double angle = _controller.value * 2 * math.pi;

        // 🌈 Los colores del gradiente rotan cambiando suavemente
        final gradient = RadialGradient(
          radius: 2.0,
          colors: [
            HSVColor.fromAHSV(1.0, (angle * 180 / math.pi) % 360, 1, 1)
                .toColor(),
            HSVColor.fromAHSV(1.0, (angle * 180 / math.pi + 120) % 360, 1, 1)
                .toColor(),
            HSVColor.fromAHSV(1.0, (angle * 180 / math.pi + 240) % 360, 1, 1)
                .toColor(),
            Colors.black,
          ],
          center: Alignment.center,
        );

        return Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: gradient,
          ),
          child: const Center(
            child: Text(
              "Gradiente RGB animado",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
