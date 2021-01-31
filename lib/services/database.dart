

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_joker/models/game.dart';
import 'package:el_joker/models/user.dart';
import 'package:geolocator/geolocator.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

//collection reference to user data
  final CollectionReference userCollection = Firestore.instance.collection(
      'users');

//collection reference to game data
  final CollectionReference gameCollection = Firestore.instance.collection(
      'Games');

//update/create user data method
  Future updateUserData(String firstName, String lastName,
      DateTime dateOfBirth) async {
    return await userCollection.document(uid).setData(
        {
          'firstName': firstName,
          'lastName': lastName,
          'dateOfBirth': dateOfBirth,
        }
    );
  }

//update/create game data method
  Future updateGameData(String activity, int totalPlayers, int currentPlayers,
      longitude, latitude) async {
    return await gameCollection.document(uid).setData(
        {
          'activity': activity,
          'totalPlayers': totalPlayers,
          'currentPlayers': currentPlayers,
          'longitude': longitude,
          'latitude': latitude
        }
    );
  }

  Future deleteGameData() async {
    return await gameCollection.document(uid).delete();
  }

//using stream to retrieve data
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      dateOfBirth: snapshot.data['dateOfBirth'],
    );
  }


// get user doc stream
  Stream <UserData> get userData {
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  List<Game> _gameFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
    return Game(
      creatorId: doc.documentID,
      activity: doc.data['activity'],
      currentPlayers: doc.data['currentPlayers'],
      totalPlayers: doc.data['totalPlayers'],
      longitude: doc.data['longitude'],
      latitude: doc.data['latitude'],
    );}).toList();
  }

  Stream <List<Game>> get games {
    return gameCollection.snapshots().map(_gameFromSnapshot);
  }
}





