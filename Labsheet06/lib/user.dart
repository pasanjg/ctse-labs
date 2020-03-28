import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  DocumentReference reference;

  User({this.name, this.reference});

  User.fromMap(Map<String, dynamic> map, {this.reference}) {
    name = map['name'];
  }

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'name': name};
  }
}
