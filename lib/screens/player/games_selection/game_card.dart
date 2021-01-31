//todo ask user about number of jokers/players (if a user is bringing someone else with them) &make sure that the user can only click one

import 'package:el_joker/models/game.dart';
import 'package:el_joker/models/user.dart';
import 'package:el_joker/services/database.dart';
import 'package:el_joker/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class GameCard extends StatelessWidget {
  final String distance;
  final Game game;

  GameCard({this.game,this.distance});



  @override
  Widget build(BuildContext context) {
    DatabaseService _database = DatabaseService(uid:game.creatorId);



    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Text(game.activity),
          subtitle: Text('${game.currentPlayers}/${game.totalPlayers} distance: ${distance}km'),
        onTap: (){
            if(game.currentPlayers<game.totalPlayers){
            _database.updateGameData(game.activity, game.totalPlayers, game.currentPlayers+1, game.longitude, game.latitude);
            print(game.creatorId);
           Navigator.pushNamed(context, '/gameLocation',arguments: game);

            //todo handle max/max number of players
        }
            else{
              _database.deleteGameData();
            }
            },
        ),

      ),
    );
  }
}

