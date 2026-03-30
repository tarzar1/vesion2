import 'package:flutter/material.dart';
import 'api_service.dart';
import 'offers_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool loading = false;

  final name = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  final api = ApiService();

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void submit() async {
    setState(() => loading = true);
    bool success = false;

    if (isLogin) {
      success = await api.login(email.text, password.text);
      if (success) {
        showMsg("Login exitoso 🚀");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => OffersScreen(email: email.text)),
        );
      } else {
        showMsg("Error: Email o password incorrectos");
      }
    } else {
      success = await api.register({
        "id": "temp",
        "name": name.text,
        "last_name": lastName.text,
        "phone": phone.text,
        "email": email.text,
        "password": password.text,
        "active": true,
        "offers": [],
      });

      if (success) showMsg("Usuario registrado ✅");
      else showMsg("Error al registrar usuario ❌");
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(isLogin ? "Login" : "Sign Up",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                if (!isLogin) ...[
                  TextField(controller: name, decoration: const InputDecoration(labelText: "Name")),
                  TextField(controller: lastName, decoration: const InputDecoration(labelText: "Last Name")),
                  TextField(controller: phone, decoration: const InputDecoration(labelText: "Phone")),
                ],
                TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
                TextField(controller: password, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
                const SizedBox(height: 20),
                loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(onPressed: submit, child: Text(isLogin ? "Login" : "Register")),
                TextButton(
                    onPressed: () => setState(() => isLogin = !isLogin),
                    child: Text(isLogin ? "Crear cuenta" : "Ya tengo cuenta")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}