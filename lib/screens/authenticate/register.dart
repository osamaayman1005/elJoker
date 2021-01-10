import 'package:date_time_picker/date_time_picker.dart';
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

//TODO user personal data such as name, age ...etc
class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
//the key for validation of the register form
  final _formKey = GlobalKey<FormState>();

//text fields state
  String email = '';
  String password = '';
  String error = '';
  String firstName = '';
  String lastName = '';
  DateTime dateOfBirth = DateTime(2020);
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
            icon: Icon(
              Icons.person,
              color: Colors.indigo[100],
            ),
            label: Text(
              'Sign in',
              style: TextStyle(color: Colors.indigo[100]),
            ),
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
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration: TextInputDecoration.copyWith(
                            hintText: 'First name'),
                        validator: (val) =>
                            val.isEmpty ? 'enter your first name' : null,
                        onChanged: (val) {
                          setState(() {
                            firstName = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration:
                            TextInputDecoration.copyWith(hintText: 'last name'),
                        validator: (val) =>
                            val.isEmpty ? 'enter your last name' : null,
                        onChanged: (val) {
                          setState(() {
                            lastName = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                  decoration:
                      TextInputDecoration.copyWith(hintText: 'Password'),
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
                  height: 20,
                ),
                DateTimePicker(
                  decoration: TextInputDecoration,
                  initialValue: '2020-05-10',
                  firstDate: DateTime(1921),
                  lastDate: DateTime(2021),
                  dateLabelText: 'Date of birth',
                  onChanged: (val) {
                    setState(() {
                      dateOfBirth = DateTime.parse(val);
                    });
                  },
                  validator: (val) {
                    print(dateOfBirth.year);
                    //TODO add date validator
                    return null;
                  },
                  onSaved: (val) => print(val),
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
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password,firstName,lastName,dateOfBirth);
                        if (result == null) {
                          setState(() {
                            error = 'please enter a valid email address';
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
