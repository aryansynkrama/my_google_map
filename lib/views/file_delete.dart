// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:joinme/utils/models/master/event.dart';
//
// class FileDelete extends StatefulWidget {
//   final Event? event;
//   final List multiSelectList;
//   final int index;
//
//   FileDelete({super.key, required this.event, required this.multiSelectList,this.index = 0});
//
//   @override
//   State<FileDelete> createState() => _FileDeleteState();
// }
//
// class _FileDeleteState extends State<FileDelete> {
//   late GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(18.50736639989876, 73.86396992441644);
//   late BitmapDescriptor customMarkerIcon;
//
//   double latitude = 0.0;
//   double longitude = 0.0;
//   void _loadCustomMarkerIcon() async {
//     final ImageConfiguration config = ImageConfiguration(devicePixelRatio: 10);
//     final String assetName = 'assets/destination.png';
//     final BitmapDescriptor bitmapDescriptor =
//     await BitmapDescriptor.fromAssetImage(config, assetName);
//     setState(() {
//       customMarkerIcon = bitmapDescriptor;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _loadCustomMarkerIcon();
//     String originalString = widget.event?.latitude ?? '';
//     latitude = double.tryParse(removeDegreeSuffix(originalString)) ?? 0.0;
//     String originalString1 = widget.event?.longitude ?? '';
//     longitude = double.tryParse(removeDegreeSuffix(originalString1)) ?? 0.0;
//   }
//
//   void _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print(widget.multiSelectList);
//     // var x = double.parse(widget.multiSelectList[widget.index]['lat']);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Maps Sample App'),
//         elevation: 2,
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(
//             double.parse(widget.multiSelectList[widget.index]['lat']),
//             double.parse(widget.multiSelectList[widget.index]['long']),
//           ),
//           zoom: 11.0,
//         ),
//         // markers: <Marker>{
//         //   Marker(
//         //     markerId: MarkerId('1'),
//         //     position: LatLng(
//         //       double.parse(widget.multiSelectList[widget.index]['lat']),
//         //       double.parse(widget.multiSelectList[widget.index]['long']),
//         //     ),
//         //
//         //     icon: customMarkerIcon,
//         //     // position: LatLng(
//         //     //     18.515505383310064, 73.86499989107611
//         //     // ),
//         //
//         //     infoWindow: InfoWindow(
//         //       title: widget.event?.name,
//         //       snippet: widget.multiSelectList[widget.index]['title'],
//         //     ),
//         //   ),
//         //   // Uncomment the following markers to add more markers on the map
//         //   // Marker(
//         //   //   markerId: MarkerId('2'),
//         //   //   position: LatLng(19.64775315203547, 73.75363066792488),
//         //   //   infoWindow: InfoWindow(
//         //   //     title: 'Second Position',
//         //   //   ),
//         //   // ),
//         //   // Marker(
//         //   //   markerId: MarkerId('3'),
//         //   //   position: LatLng(17.53636044513345, 73.88965888032236),
//         //   //   infoWindow: InfoWindow(
//         //   //     title: 'Third Position',
//         //   //   ),
//         //   // ),
//         // },
//         markers: widget.multiSelectList.map((item) => Marker(
//           markerId: MarkerId(item['id'].toString()),
//           position: LatLng(
//             double.parse(item['lat']),
//             double.parse(item['long']),
//           ),
//           icon: customMarkerIcon,
//           infoWindow: InfoWindow(
//             title: widget.event?.name,
//             snippet: item['title'],
//           ),
//         )).toSet(),
//       ),
//     );
//   }
//
//   String removeDegreeSuffix(String input) {
//     if (input.endsWith("Â° E")) {
//       return input.replaceAll("Â° E", "");
//     } else if (input.endsWith("Â° N")) {
//       return input.replaceAll("Â° N", "");
//     } else {
//       // return the original input string if it doesn't end with "Â° E" or "Â° N"
//       return input;
//     }
//   }
// }
