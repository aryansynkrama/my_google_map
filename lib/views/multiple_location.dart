import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MultipleScreen extends StatefulWidget {
  const MultipleScreen({super.key});

  @override
  State<MultipleScreen> createState() => _MultipleScreenState();
}

class _MultipleScreenState extends State<MultipleScreen> {
  late GoogleMapController _controller;
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  final LatLng _center = const LatLng(18.49638910359029, 73.86948131024836);

  List<Marker> _markers = [];
  late LatLng _selectedLocation;
  int count = 0;
  int count1 = 0;
  int count2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Places"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        onTap: (LatLng latLng) {
          setState(() {
            _markers.add(
              Marker(
                markerId: MarkerId(
                  "${_markers.length + 1}",
                ),
                infoWindow: InfoWindow(
                  title: "Added Marker ${count++}",
                ),
                position: latLng,
              ),
            );
          });
          print(
              "Latitude ${count1++}: ${latLng.latitude}, Longitude ${count2++}: ${latLng.longitude}");
        },
        markers: Set<Marker>.of(_markers),
      ),
    );
  }
}
