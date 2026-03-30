import 'package:flutter/material.dart';
import 'package:taxi_app/main2.dart';
import 'auth_screen.dart'; // tu pantalla principal después de login
import 'storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await StorageService().getToken();
  runApp(MyApp(initialToken: token));
}

class MyApp extends StatelessWidget {
  final String? initialToken;
  const MyApp({super.key, this.initialToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialToken != null ? Main2() : const AuthScreen(),
      
    );
  }
}