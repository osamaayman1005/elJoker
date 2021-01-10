import 'package:el_joker/services/auth.dart';
import 'package:el_joker/shared/constants.dart';
import 'package:flutter/material.dart';

// Register Widget
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
//the key for validation of the register form
  final _formKey = GlobalKey<FormState>();

//text fields state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Sign up'),
        actions: [
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign in'),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: TextInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: TextInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6
                      ? 'enter a password 6 or more characters'
                      : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: TextInputDecoration.copyWith(
                      hintText: 'Confirm your password'),
                  validator: (val) => val != password
                      ? 'Passwords do not match. Please try again'
                      : null,
                  obscureText: true,
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
height: 60,
                  width: 320,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registerWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            error='please enter a valid email address';
                          });
                        }
                      }
                    },
                    color: Colors.indigo,


                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
