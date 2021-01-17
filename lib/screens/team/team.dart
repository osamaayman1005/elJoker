//TODO implement team screen(s)
import 'package:el_joker/models/user.dart';
import 'package:el_joker/screens/team/waiting.dart';
import 'package:el_joker/services/auth.dart';
import 'package:el_joker/services/database.dart';
import 'package:el_joker/shared/constants.dart';
import 'package:el_joker/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  double longitude=0;
  double latitude=0;
  bool loading = false;

void getCurrentLocation() async{
  LocationPermission permission = await Geolocator.requestPermission();
  Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print(location);
  setState(() {
    longitude=location.longitude;
    latitude=location.latitude;
  });
}
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    DatabaseService _database = DatabaseService(uid: user.uid);
    //toggle between waiting for players and game settings screen
    return loading?Loading():Scaffold(
      appBar: AppBar(
        title: Text('Game '),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30,),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration: TextInputDecoration.copyWith(
                          hintText: 'current players'),
                      validator: (val) =>
                      int.tryParse(val) == null ||val.isEmpty? 'enter a number' : null,
                      onChanged: (val) {
                        setState(() {
                          currentPlayers = int.tryParse(val);
                        });
                      },
                    ),
                  ),
                  Text('/',
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration:
                      TextInputDecoration.copyWith(hintText: 'total players'),
                      validator: (val) =>
                      int.tryParse(val) == null ||val.isEmpty? 'enter a number' : null,
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
                  elevation: 5.0,
                  onPressed: () async {
                    if(currentPlayers>=totalPlayers){
                      setState(() {
                        error='please enter correct players numbers';
                      });
                      return;
                    }
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                  await getCurrentLocation();
                  dynamic result = await _database.updateGameData(activity, totalPlayers, currentPlayers,longitude,latitude);

                      if (result == null) {
                        setState(() {

                          error = 'please enter a valid activity';
                        });
                      }
                      setState(() {
                        loading = false;
                      });
                      Navigator.pushNamed(context, '/waitingForPlayers');
                    }
                  },
                  color: Colors.indigo,
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ),
              Text(error,
              style: TextStyle(
                color: Colors.red,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
