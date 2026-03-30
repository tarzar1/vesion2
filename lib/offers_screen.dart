import 'package:flutter/material.dart';
import 'api_service.dart';
import 'update_offer_screen.dart';
import 'auth_screen.dart';

class OffersScreen extends StatefulWidget {
  final String email;
  const OffersScreen({super.key, required this.email});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final api = ApiService();
  List<Map<String, dynamic>> offers = [];
  bool loading = true;

  void fetchOffers() async {
    setState(() => loading = true);
    final data = await api.getOffers();
    setState(() {
      offers = data ?? [];
      loading = false;
    });
  }

  void logout() async {
    await api.logout();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthScreen()));
  }

  @override
  void initState() {
    super.initState();
    fetchOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ofertas"),
        actions: [IconButton(onPressed: logout, icon: const Icon(Icons.logout))],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return ListTile(
                  title: Text("Precio: ${offer['driver_name']} ${offer['driver_last_name']} - \$${offer['email']}"),
                  subtitle: Text("Viajes: ${offer['trips']}"),
                  
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UpdateOfferScreen(email: widget.email, offer: offer)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}