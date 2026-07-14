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

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? "unKnown",
      email: user.email!,
    );
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'name': name, 'email': email};
  }
}
