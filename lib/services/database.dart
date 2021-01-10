//TODO creating user personal data

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
final String uid ;
DatabaseService({this.uid});
//collection reference
final CollectionReference userCollection = Firestore.instance.collection('users');

Future updateUserData(String firstName,String lastName,DateTime dateOfBirth) async {

  return await userCollection.document(uid).setData(
{
'firstName':firstName,
  'lastName':lastName,
  'dateOfBirth':dateOfBirth,
}
  );
}
}



//TODO creating team data


