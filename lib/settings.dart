import 'package:flutter/material.dart';

void main() {
  runApp(const Settings());
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(129, 35, 35, 41),
        body: Column(
          children: [
            Container(
              width: 430,
              height: 160,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 24, 24),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [SizedBox(width: 40,),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 61, 50, 49),
                      image: DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/6/6a/PNG_Test.png")
                      ,scale: 1.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    
                  ),Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                     
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [SizedBox(height: 30,),
                        Text("username: Rickydeleon26",style: TextStyle(color: Colors.white)), Text("name: Ricky De Leon",style: TextStyle(color: Colors.white)), Text("email: Deleonricky161@mail.com",style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                 
                    borderRadius: BorderRadius.circular(10),
                  gradient: RadialGradient(colors: [    Colors.blue,
        Colors.purple,
        Colors.black,
        Colors.black,],radius: 5,focalRadius: 1),boxShadow: [BoxShadow(blurStyle: BlurStyle.outer,color: Colors.purple,spreadRadius: 0,blurRadius: 15)]
                  ),
                  child: const Center(
                    child: Text(
                      "data",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),Container(
              height: 100,width: 100,
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

          ],
        ),
      ),
    );
  }
}
