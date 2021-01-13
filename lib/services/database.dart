

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_joker/models/game.dart';
import 'package:el_joker/models/user.dart';

class DatabaseService {
final String uid ;
DatabaseService({this.uid});
//collection reference to user data
final CollectionReference userCollection = Firestore.instance.collection('users');
//update/create user data method
Future updateUserData(String firstName,String lastName,DateTime dateOfBirth) async {

  return await userCollection.document(uid).setData(
{
'firstName':firstName,
  'lastName':lastName,
  'dateOfBirth':dateOfBirth,
}
  );
}

//update/create game data method
  Future updateGameData(String activity,int totalPlayers,int currentPlayers) async {
//collection reference to game data
    final CollectionReference gameCollection = Firestore.instance.collection('Games');
    return await gameCollection.document(uid).setData(
        {
          'activity':activity,
          'totalPlayers':totalPlayers,
          'currentPlayers':currentPlayers,
        }
    );
  }
//using stream to retrieve data
UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
return UserData(
uid: uid,
firstName:snapshot.data['firstName'],
  lastName: snapshot.data['lastName'],
  dateOfBirth: snapshot.data['dateOfBirth'],
);
}


// get user doc stream
  Stream <UserData> get userData {
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
  Game _gameFromSnapshot(DocumentSnapshot snapshot){
  return Game(
    creatorId: uid,
    activity: snapshot.data['activity'],
    currentPlayers: snapshot.data['currentPlayers'],
    totalPlayers: snapshot.data['totalPlayers'],
  );
  }

}





