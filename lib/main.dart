import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rive Button Example',
      theme: ThemeData.dark(),
      home: const RiveButtonPage(),
    );
  }
}

class RiveButtonPage extends StatefulWidget {
  const RiveButtonPage({super.key});

  @override
  State<RiveButtonPage> createState() => _RiveButtonPageState();
}

class _RiveButtonPageState extends State<RiveButtonPage> {
  SMIInput<bool>? isHovered;
  SMIInput<bool>? isPressed;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'ButtonStateMachine', // nombre exacto en tu archivo .riv
    );
    if (controller != null) {
      artboard.addController(controller);
      isHovered = controller.findInput<bool>('isHovered');
      isPressed = controller.findInput<bool>('isPressed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (_) => isHovered?.value = true,
          onExit: (_) => isHovered?.value = false,
          child: GestureDetector(
            onTapDown: (_) => isPressed?.value = true,
            onTapUp: (_) => isPressed?.value = false,
            child: SizedBox(
              width: 200,
              height: 80,
              child: RiveAnimation.asset(
                'assets/17543-36177-interactive-bento-grid.riv',
                onInit: _onRiveInit,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
