import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Mapa());

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  LatLng? currentLocation;
  LatLng destination = LatLng(40.4168, -3.7038); // Ejemplo: Madrid
  List<LatLng> routePoints = [];

  @override
  void initState() {
    super.initState();
    _startTracking();
  }

  void _startTracking() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) return;

    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 52,
        
        
        
      ),
    ).listen((Position position) async {
      LatLng newLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        currentLocation = newLocation;
      });

      // Llamar OSRM solo si tenemos ubicación
      if (currentLocation != null) {
        await _getRoute(currentLocation!, destination);
      }
    });
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    String url ='http://192.168.1.187:5000/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final coords = data['routes'][0]['geometry']['coordinates'] as List;

      List<LatLng> points = coords
          .map((c) => LatLng(c[1] as double, c[0] as double))
          .toList();

      setState(() {
        routePoints = points;
      });
    } else {
      print("Error al obtener ruta: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.transparent, // elimina el blanco de fondo
    body: Center(
      child: Container(
        width: 390,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0),
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent, // clave: fondo transparente
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FlutterMap(
            options: MapOptions(
              initialCenter: currentLocation ?? LatLng(40.4168, -3.7038),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://cartodb-basemaps-a.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  if (currentLocation != null)
                    Marker(
                      point: currentLocation!,
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.person_pin_circle,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  Marker(
                    point: destination,
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
              if (routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints,
                      strokeWidth: 4,
                      color: Colors.green,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    ),
  ),
);

  }
}
