

import 'package:cloud_firestore/cloud_firestore.dart';

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
}





