import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLiveLocation extends StatefulWidget {
  const MyLiveLocation({super.key});

  @override
  State<MyLiveLocation> createState() => _MyLiveLocationState();
}

class _MyLiveLocationState extends State<MyLiveLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(
      18.392748352020984,
      73.97958867251873,
    ),
  );
  final List<Marker> _markers = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(18.64775315203547, 73.75363066792488),
      infoWindow: InfoWindow(
        title: 'Initial Position',
      ),
    ),
  ];
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("Error$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Live Location"),
      ),
      body: Container(
        height: 400,
        width: 400,
        child: GoogleMap(
            initialCameraPosition: _kGoogle,
            markers: Set<Marker>.of(_markers),
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: true,
            onTap: (LatLng latLng) {
              print(
                  "Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getUserCurrentLocation().then((e) async {
            print("Latitude: ${e.latitude}, Longitude: ${e.longitude}");
            getMarkerIcon(url: 'https://avatars.githubusercontent.com/u/405837?v=4', markerSize: 64).then((value) {
              _markers.add(

                Marker(
                  draggable: true,
                  icon: value != null ? BitmapDescriptor.fromBytes(value) : BitmapDescriptor.defaultMarker,
                  markerId: const MarkerId("2"),
                  position: LatLng(e.latitude, e.longitude),
                  infoWindow: const InfoWindow(
                    title: "My Current Location",
                    // snippet: "${value.} ${value.longitude}",
                  ),
                ),
              );
            });

            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(
                e.latitude,
                e.longitude,
              ),
              zoom: 14.0,
            );
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(cameraPosition),
            );
            setState(() {});
          });
        },
        child: const Icon(Icons.local_activity),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
  Future<Uint8List?> getMarkerIcon({required String url, required int markerSize}) async {
    try {
      var markerImageFile = await DefaultCacheManager().getSingleFile(url);
      var markerImageByte = await markerImageFile.readAsBytes();
      var markerImageCodec = await instantiateImageCodec(
        markerImageByte,
        targetWidth: markerSize,
        targetHeight: markerSize,
      );
      var frameInfo = await markerImageCodec.getNextFrame();
      var byteData = await frameInfo.image.toByteData(
        format: ImageByteFormat.png,
      );
      var resizedMarkerImageBytes = byteData?.buffer.asUint8List();
      return resizedMarkerImageBytes;
    } catch (e) {
      return null;
    }
  }
}
