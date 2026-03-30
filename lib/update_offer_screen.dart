import 'package:flutter/material.dart';
import 'api_service.dart';

class UpdateOfferScreen extends StatefulWidget {
  final String email;
  final Map<String, dynamic> offer;
  const UpdateOfferScreen({super.key, required this.email, required this.offer});

  @override
  State<UpdateOfferScreen> createState() => _UpdateOfferScreenState();
}

class _UpdateOfferScreenState extends State<UpdateOfferScreen> {
  late TextEditingController passwordController;
  final api = ApiService();
  bool loading = false;

   @override
   void initState() {
     super.initState();
     passwordController = TextEditingController(text: widget.offer['password'].toString());
   }

  void passwordResetd() async {
    setState(() => loading = true);
    final success = await api.resetPassword(passwordController.text, widget.email, widget.offer['id']);

    setState(() => loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(success ? "Oferta actualizada ✅" : "no puede ser igual a la actual ❌")),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actualizar Oferta")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "password")),

            const SizedBox(height: 20),
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: passwordResetd, child: const Text("Actualizar")),
          ],
        ),
      ),
    );
  }
}