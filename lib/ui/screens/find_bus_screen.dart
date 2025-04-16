import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FindBusScreen extends StatefulWidget {
  const FindBusScreen({super.key});

  @override
  State<FindBusScreen> createState() => _FindBusScreenState();
}

class _FindBusScreenState extends State<FindBusScreen> {
  final LatLng _initialLocation = LatLng(
    23.777176,
    90.399452,
  ); // Example: Dhaka, BD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Bus'),
        backgroundColor: Color(0xff50C2C9),
      ),
      body: FlutterMap(
        options: MapOptions(initialCenter: _initialLocation, initialZoom: 13.0),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.your_app_name',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _initialLocation,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
