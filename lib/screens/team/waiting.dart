
import 'package:el_joker/models/user.dart';
import 'package:el_joker/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//todo add some style to this screen
class WaitingForPlayers extends StatefulWidget {

  @override
  _WaitingForPlayersState createState() => _WaitingForPlayersState();
}

class _WaitingForPlayersState extends State<WaitingForPlayers> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    DatabaseService _database = DatabaseService(uid: user.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('Game settings'),
        backgroundColor: Colors.indigo,

      ),
      body: Center(
        child: Column(
          children: [
            Text('Waiting for player(s)'),
            RaisedButton(onPressed: ()async{
              _database.deleteGameData();
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text('cancel'),
            ),
            RaisedButton(onPressed: ()async{
              _database.deleteGameData();
              Navigator.popUntil(context, ModalRoute.withName('/team'));
            },
              child: Text('edit game'),
            ),
          ],
        ),
      ),
    );
  }
}
