//TODO implement player screen(s)
import 'package:el_joker/models/game.dart';
import 'file:///E:/Projects/elJoker/lib/screens/player/games_selection/game_list.dart';
import 'package:el_joker/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Game>>.value(
      value:DatabaseService().games,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Choose a game'),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          child: GameList(),
        ),
      ),
    );
  }
}
