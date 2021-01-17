import 'package:el_joker/screens/player/player.dart';
import 'package:el_joker/screens/team/team.dart';
import 'package:el_joker/screens/team/waiting.dart';
import 'package:el_joker/screens/wrapper.dart';
import 'package:el_joker/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context)=>Wrapper(),
          '/team':(context)=>Team(),
          '/player':(context)=>Player(),
          '/waitingForPlayers':(context)=>WaitingForPlayers(),
        },
      ),
    );
  }
}
