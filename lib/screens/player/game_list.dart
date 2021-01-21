//TODO implement player screen(s)
import 'dart:io';

import 'package:el_joker/models/game.dart';
import 'package:el_joker/models/user.dart';
import 'package:el_joker/screens/player/game_card.dart';
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
  double locationX=0;
  double locationY=0;
  Future distanceInMeters()async{
    LocationPermission permission = await Geolocator.requestPermission() ;
    Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high) ;
    locationX = await location.longitude;
     locationY = await location.latitude;
    print(locationY);
    print(locationX);
    }
  @override
  Widget build(BuildContext context) {
    distanceInMeters();
    //todo fix the first  infinite load each run
    final games = Provider.of<List<Game>>(context) ??[];
    return locationX==0?Loading():ListView.builder(
        itemCount: games.length,
        itemBuilder:(context,index){
        double distance = Geolocator.distanceBetween(locationY, locationX, games[index].locationY, games[index].locationX);
        print(distance);
          return GameCard(game: games[index],distance: distance/1000,);
        }
    );
  }
}
