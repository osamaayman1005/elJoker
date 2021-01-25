//TODO implement player screen(s)
import 'dart:io';

import 'package:el_joker/models/game.dart';
import 'package:el_joker/models/user.dart';
import 'file:///E:/Projects/elJoker/lib/screens/player/games_selection/game_card.dart';

import 'package:el_joker/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:el_joker/services/database.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  double locationX;
  double locationY;
  bool loading = true;

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    locationX = location.longitude;
    locationY = location.latitude;
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();

    final games = Provider.of<List<Game>>(context) ?? [];
    return FutureBuilder(
        future: getCurrentLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return loading
              ? Loading()
              : ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    double distance = Geolocator.distanceBetween(
                        locationY,
                        locationX,
                        games[index].locationY,
                        games[index].locationX);
                    print(distance);
                    distance /= 1000;

                    return GameCard(
                      game: games[index],
                      distance: distance.toStringAsFixed(1),
                    );
                  });
        });
  }
}
