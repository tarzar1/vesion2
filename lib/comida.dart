import 'package:flutter/material.dart';

void main() => runApp(const Comida());

class Comida extends StatelessWidget {
  final String categoria; 
  const Comida({super.key, 
  this.categoria = "Comida"
  });



  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: [

     Center(
       child: Container(
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
       color: const Color.fromARGB(255, 35, 24, 43)
       ),
        margin: const EdgeInsets.all(9),
        padding: const EdgeInsets.all(8.0),
       height: 500,child: Center(
            child: Column(children: [lista_comida(),lista_comida()],)
          ),),
     )
        
      ,],
    );
      
  }

}

class lista_comida extends StatelessWidget {
  const lista_comida({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 760,height: 240,
      child: Column(
        children: [
          Text( "categoria",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Container(
            width: 760,height: 150,
             decoration: BoxDecoration(color: const Color.fromARGB(0, 32, 22, 34),
             borderRadius: BorderRadius.circular(10),
             boxShadow: [BoxShadow(color: Colors.purple,blurRadius: 20,spreadRadius: 1,blurStyle: BlurStyle.outer,)]),
             
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 100,
              semanticChildCount: 3,
          
              children: [
          con(),con(),con(),con(),con(),con(),con(),con(),con(),
          
              ],
            )
           ),
        ],
      ),
    );
  }
}

class con extends StatelessWidget {
  const con({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GestureDetector(
        onTap: () {
          // Acción al tocar el contenedor
        },
        child: Container(
          width: 100,
          height: 130,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Cambia la posición de la sombra
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const [
              Icon(Icons.fastfood, size: 50, color: Colors.purple),
              SizedBox(height: 10),
              Text(
                'Comida',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
       ),
      ],
    );
  }
}