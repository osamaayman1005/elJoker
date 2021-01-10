import 'package:el_joker/screens/authenticate/register.dart';
import 'package:el_joker/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

//widget to wrap all authentication widgets and navigate through them
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  // boolean for showing either register screen or sign in screen
bool registered = false ;
// toggle the registered boolean
void toggleView() {
  setState(() {
    registered = !registered;
  });
}
  @override
  Widget build(BuildContext context) {
    if(registered){
      return Container(
        child: SignIn(toggleView:toggleView),
      );
    }
    else{
      return Container(
        child: Register(toggleView:toggleView),
      );
    }
  }
}
