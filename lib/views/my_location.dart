import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  late GoogleMapController _controller;
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  final LatLng _center = const LatLng(18.49638910359029, 73.86948131024836);

  List<Marker> _markers = [];
  late LatLng _selectedLocation;

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
            _selectedLocation = latLng;
            _markers.clear();
            _markers.add(
              Marker(
                markerId: MarkerId("selected_location"),
                position: latLng,
              ),
            );
          });
          print("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
        },
        markers: Set<Marker>.of(_markers),
      ),
    );
  }
}
