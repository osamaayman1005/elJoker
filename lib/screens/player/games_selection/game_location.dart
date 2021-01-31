import 'dart:collection';

import 'package:el_joker/models/game.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//todo cancel button
//todo adjust zoom and camera target
class GameLocation extends StatefulWidget {

  @override
  _GameLocationState createState() => _GameLocationState();
}

class _GameLocationState extends State<GameLocation> {
  Game _game ;
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller){
      _mapController = controller;

      setState(() {
        _markers.add(Marker(markerId: MarkerId('0'),
          position: LatLng(_game.latitude,_game.longitude), infoWindow: InfoWindow(
                title: _game.activity,
              snippet: '${_game.currentPlayers}/${_game.totalPlayers}',

            ) ));
      });
  }
  @override
  Widget build(BuildContext context) {
    _game = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('everyone is waiting for you'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target:   LatLng(_game.latitude,_game.longitude),
              zoom: 15,

            ),
            markers: _markers,
            myLocationEnabled: true,
            mapType:MapType.normal,
          ),
        ),
      ),
    );
  }
}
