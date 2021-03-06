import 'package:el_joker/services/auth.dart';
import 'package:flutter/material.dart';

//home page to allow the user to choose,
//whether a player or a team
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//TODO add the option to choose player(joker) or team
class _HomeState extends State<Home> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El Joker'),
        backgroundColor: Colors.indigo,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                return await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Sign out'),textColor: Colors.white,),
        ],
      ),
      backgroundColor: Colors.indigo[100],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: RaisedButton(
                child: Text('joker'),
                color: Colors.indigo,
                onPressed: () async{
                  dynamic result =await Navigator.pushNamed(context, '/player');
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: RaisedButton(
                child: Text('team'),
                color: Colors.indigo,
                onPressed: () async{
                  dynamic result =await Navigator.pushNamed(context, '/team');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
