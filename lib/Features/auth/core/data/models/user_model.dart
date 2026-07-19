import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;

  UserModel({required this.uid, required this.name, required this.email});

  factory UserModel.fromFirebase({required User user, String? nameOverride}) {
    return UserModel(
      uid: user.uid,
      name: nameOverride ?? user.displayName ?? "unKnown",
      email: user.email!,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'createdAt': Timestamp.now(),
    };
  }
}
