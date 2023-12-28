import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition position = CameraPosition(
    target: LatLng(13.721545007390146, 100.45330488046963), //
    zoom: 18,
  );
  _openGoogleMapApp(double lat, double long) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lunch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: <Marker>[
          Marker(
              markerId: MarkerId('SiamU'),
              position: LatLng(13.721545007390146, 100.45330488046963),
              infoWindow:
                  InfoWindow(title: 'Siam University', snippet: 'Hide out'),
              onTap: () {
                _openGoogleMapApp(13.721545007390146, 100.45330488046963);
              }),
        ].toSet(),
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
