import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final Color color;      // ✅ variable que viene de fuera
  final String validad;
  final String nombre;
  final int monto; 
  final String apellido;
  final  String date;
  final String hora;

  const Label({
    super.key,
    required this.color,   // ✅ se requiere al crear el widget
    required this.validad,
    required this.nombre,
    required this.monto,
    required this.apellido,
    required this.date,
    required this.hora // ✅ se requiere al crear el widget
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(155, 32, 32, 36),
          borderRadius: BorderRadius.circular(10),boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(0, 206, 89, 89),
        blurRadius: 2,
        spreadRadius: 1,
        
        blurStyle: BlurStyle.normal,
      ),
    ],
        ),
        width: 400,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Columna izquierda
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.safety_check_outlined, color: Colors.white),
                  SizedBox(height: 8),
                  Text("Transferir", style: TextStyle(color: Colors.white)),
                ],
              ),

              const SizedBox(width: 12),

              // Contenedor derecho
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(195, 46, 46, 59),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: const Color.fromARGB(255, 70, 32, 63),blurRadius: 10,spreadRadius: 0,blurStyle: BlurStyle.outer)]
                    
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Transacción: ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            validad, // ✅ texto pasado por parámetro
                            style: TextStyle(color: color), // ✅ color dinámico
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "$nombre $apellido: \$$monto",  // ✅ texto pasado por parámetro
                        style: TextStyle(color: color),
                      ),
                      const SizedBox(height: 6),
                      const Row(
                        children: [
                          Text("Fecha: ",
                              style: TextStyle(color: Colors.amber)),
                          Text("10/26/2025",
                              style: TextStyle(color: Colors.white)),

                        ],
                        
                      ),Row(
                        children: [
                          Text("hora: $hora",
                                  style: TextStyle(color: Colors.amber)),Text("10/26/2025",
                                  style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.help, color: Colors.white),
                tooltip: "Error en la transferencia. Intente más tarde.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
