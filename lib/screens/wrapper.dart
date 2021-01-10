import 'package:el_joker/models/user.dart';
import 'package:el_joker/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

//widget to listen to user object changes to navigate to authentication or home widgets
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
