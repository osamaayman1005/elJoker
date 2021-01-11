import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(247, 132, 0, 1),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Image.asset(
            "assets/jokerforloading.gif",
            height: 350.0,
            width:350.0,
            
          ),
            Text('Loading'
            ,style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(0, 0, 49, 1),

              ),
            ),
        ]),
      ),
    );
  }
}
