//TODO implement player screen(s)
import 'package:el_joker/models/game.dart';
import 'package:el_joker/screens/player/game_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:el_joker/services/database.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    final games = Provider.of<List<Game>>(context) ??[];
    return ListView.builder(
        itemCount: games.length,
        itemBuilder:(context,index){
          return GameCard(game: games[index]);
        }
    );
  }
}
