import 'package:el_joker/models/user.dart';
import 'package:el_joker/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //stream of user objects to show user changes
  Stream<User> get user {
    return _auth.onAuthStateChanged.map((_userFromFirebaseUser));
  }

//sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }  catch (e) {
      print(e.toString());
    }
    
  }
//register with email and password
Future registerWithEmailAndPassword
    (String email,String password,String firstName,String lastName,DateTime dateOfBirth) async{
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    await DatabaseService(uid: user.uid).updateUserData(firstName, lastName, dateOfBirth);
    return _userFromFirebaseUser(user);
  }  catch (e) {
    print(e.toString());
  }
}

//sign out
Future signOut() async {
try {
  return await _auth.signOut();
}  catch (e) {
  print(e.toString());
}
}

}
