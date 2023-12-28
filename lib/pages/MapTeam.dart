import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapTeam extends StatefulWidget {
  const MapTeam({Key? key}) : super(key: key);

  @override
  State<MapTeam> createState() => _MapTeamState();
}

class _MapTeamState extends State<MapTeam> {
  Completer<GoogleMapController> _controller = Completer();

  _openGoogleMapApp(double lat, double long) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> teamname =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(teamname['teamname']),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              markers: <Marker>[
                Marker(
                  markerId: const MarkerId('Marker'),
                  position: LatLng(
                    double.parse(teamname['teamLat']!),
                    double.parse(teamname['teamLong']!),
                  ),
                  infoWindow:
                      InfoWindow(title: 'I am here', snippet: 'Hide out'),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(teamname['teamname']),
                                subtitle: Text(teamname['teamdetail']),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ].toSet(),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  double.parse(teamname['teamLat']!),
                  double.parse(teamname['teamLong']!),
                ),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          // Display additional details below the map
        ],
      ),
    );
  }
}
