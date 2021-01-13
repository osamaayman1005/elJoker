//TODO implement team screen(s)
import 'package:el_joker/models/user.dart';
import 'package:el_joker/services/auth.dart';
import 'package:el_joker/services/database.dart';
import 'package:el_joker/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {

//the key for validation of the register form
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String activity = '';
  int totalPlayers = 0;
  int currentPlayers = 0;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    DatabaseService _database = DatabaseService(uid: user.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('Game '),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: TextInputDecoration.copyWith(
                      hintText: 'activity'),
                  validator: (val) =>
                      val.isEmpty ? 'enter the activity' : null,
                  onChanged: (val) {
                    setState(() {
                      activity = val;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration: TextInputDecoration.copyWith(
                          hintText: 'current players'),

                      onChanged: (val) {
                        setState(() {
                          currentPlayers = int.tryParse(val);
                        });
                      },
                    ),
                  ),
                  Text('/'),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration:
                      TextInputDecoration.copyWith(hintText: 'total players'),

                      onChanged: (val) {
                        setState(() {
                          totalPlayers = int.tryParse(val);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 320,
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {

                  dynamic result = await _database.updateGameData(activity, totalPlayers, currentPlayers);

                      if (result == null) {
                        setState(() {

                          error = 'please enter a valid activity';
                        });
                      }
                    }
                  },
                  color: Colors.indigo,
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
