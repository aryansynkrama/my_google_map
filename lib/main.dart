import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_google_map/views/my_location.dart';
import 'package:my_google_map/views/live_location.dart';
import 'package:my_google_map/views/main_screen.dart';
// import 'package:my_google_map/views/home_page.dart';
import 'src/locations.dart' as locations;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Map<String, Marker> markers = {};
//   Future<void> _onMapCreated(GoogleMapController controller) async {
//     final googleOffices = await locations.getGoogleOffices();
//     setState(() {
//       markers.clear();
//       for (final office in googleOffices.offices) {
//         final marker = Marker(
//           markerId: MarkerId(office.name),
//           position: LatLng(office.lat, office.lng),
//           infoWindow: InfoWindow(
//             title: office.name,
//             snippet: office.address,
//           ),
//         );
//         markers[office.name] = marker;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Google Map"),
//         backgroundColor: Colors.blue,
//       ),
//       body: GoogleMap(
//         markers: markers.values.toSet(),
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: const CameraPosition(
//           target: LatLng(0, 0),
//           zoom: 2,
//         ),
//       ),
//     );
//   }
// }
