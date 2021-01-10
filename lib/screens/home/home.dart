import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El Joker'),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo[100],
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(

              height: 300,
              width: 300,
              child: Text('joker'),

            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Text('team'),
            ),
          ],
        ),
      ),
    );
  }
}
