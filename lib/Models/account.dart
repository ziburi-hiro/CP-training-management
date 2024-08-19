import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String name;
  String emailAddress;
  String sex;
  String old;
  String height;
  String weight;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  Account(
      {required this.id,
        required this.name,
        required this.emailAddress,
        required this.sex,
        required this.old,
        required this.height,
        required this.weight,
        this.createdAt,
        this.updatedAt
      });
}