import 'package:flutter/material.dart';
//todo add a map showing the player the location of the game
class GameLocation extends StatefulWidget {
  @override
  _GameLocationState createState() => _GameLocationState();
}

class _GameLocationState extends State<GameLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('everyone is waiting for you'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Center(
          child: Text('Google map to be implemented'),
        ),
      ),
    );
  }
}
