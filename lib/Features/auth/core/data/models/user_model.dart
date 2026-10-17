import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;

  @HiveField(3)
  final int interviewsUsed;
  @HiveField(4)
  final int interviewLimit;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.interviewsUsed = 0,
    this.interviewLimit = 3,
  });

  int get remainingInterviews =>
      (interviewLimit - interviewsUsed).clamp(0, interviewLimit);
  bool get isInterviewLimitReached => interviewsUsed >= interviewLimit;

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    int? interviewsUsed,
    int? interviewLimit,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      interviewsUsed: interviewsUsed ?? this.interviewsUsed,
      interviewLimit: interviewLimit ?? this.interviewLimit,
    );
  }

  factory UserModel.fromFirebase({required User user, String? nameOverride}) {
    return UserModel(
      uid: user.uid,
      name: nameOverride ?? user.displayName ?? "unKnown",
      email: user.email ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      interviewsUsed: json['interviewsUsed'] as int? ?? 0,
      interviewLimit: json['interviewLimit'] as int? ?? 3,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'interviewsUsed': interviewsUsed,
      'interviewLimit': interviewLimit,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
