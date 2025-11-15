

import 'package:flutter/material.dart';
import 'package:flutter_application_1/comida.dart';
import 'package:flutter_application_1/label.dart';
import 'package:flutter_application_1/mapa.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Stack(children: [HomeScreen()],),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  // Aquí puedes cambiar los widgets según el ícono seleccionado
  static final List<Widget> _pages = <Widget>[
    MyContent(),
    Comida(),
    Label(color: Colors.green, validad: "ff", nombre: "Juan", monto: 100, apellido: "Perez",hora: "12:30AM", date: "2024-06-01"),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(129, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 24, 43),
        title: Row(
          children: const [
            Icon(Icons.import_contacts, color: Colors.white),
            SizedBox(width: 8),
            Text("Data", style: TextStyle(color: Colors.blue)),
          ],
        ),
        actions: const [Icon(Icons.menu)],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color.fromARGB(255, 47, 32, 58),
  selectedItemColor: Colors.blueAccent,
  unselectedItemColor: Colors.white70,
  type: BottomNavigationBarType.fixed,
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.rice_bowl_outlined), label: 'Comida'),
    BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
),

    );
  }
}

class MyContent extends StatelessWidget {
  const MyContent({super.key});
  final Color _color = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return 
    
    
    Stack(children: [Container(
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(0)),
    gradient: RadialGradient(
      colors: [
        Colors.blue,
        Colors.purple,
        Colors.black,
        Colors.black,
      ],
      radius: 2.0,
      center: Alignment(0, 0), // Puedes mover el centro del gradiente
    ),
  ),
),
ListView(

      children: [
        // Top amber container
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(16),
        
          child:NewWidget()

                
        ),

        // Red + Purple section
        Center(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 500,
             
                child: Mapa(),
              ),Label(color: Colors.red, validad: "validad", nombre: "Ana", monto: 75, apellido: "Lopez",  date: "2024-06-01", hora: "10:45AM"),
              Label(color: Colors.green, validad: "validad", nombre: "Luis", monto: 200, apellido: "Martinez",hora: "1:15PM", date: "2024-06-02"),
            ],
          ),
        ),

        // Bottom amber section
      ],
    )],);
  }
}
