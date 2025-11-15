import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const GradientTextFieldApp());
}

class GradientTextFieldApp extends StatelessWidget {
  const GradientTextFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: NewWidget(),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientTextField();
  }
}

class AnimatedGradientTextField extends StatefulWidget {
  const AnimatedGradientTextField({super.key});

  @override
  State<AnimatedGradientTextField> createState() =>
      _AnimatedGradientTextFieldState();
}

class _AnimatedGradientTextFieldState extends State<AnimatedGradientTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = _controller;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Hace que el gradiente gire suavemente
        final colors = [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.purple,
          Colors.cyan,
          Colors.red,
        ];

        final gradient = SweepGradient(
          colors: colors,
          transform: GradientRotation(_controller.value * 10 * math.pi),
        );

        return Container(
          padding: const EdgeInsets.all(2.5), // grosor del borde
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(22),
            gradient: gradient,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: InputBorder.none,
                hintText: "Escribe algo...",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        );
      },
    );
  }
}
