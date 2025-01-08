import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String firstName;
  final String userId;
  final String lastName;
  final String profilePic;
  final String email;
  final String password;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  UserModel({
    this.createdAt,
    this.updatedAt,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
    required this.email,
    required this.password,
  });

  // Decode UserModel from raw JSON string
  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  // Encode UserModel to raw JSON string
  String toRawJson() => json.encode(toJson());

  // Convert JSON map to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePic: json["profile_pic"],
    email: json["email"],
    userId: json["user_id"],
    password: json["password"],
    createdAt: json["created_at"] != null
        ? Timestamp.fromMillisecondsSinceEpoch(json["created_at"])
        : null,
    updatedAt: json["updated_at"] != null
        ? Timestamp.fromMillisecondsSinceEpoch(json["updated_at"])
        : null,
  );

  // Convert UserModel object to JSON map
  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "profile_pic": profilePic,
    "email": email,
    "password": password,
    "user_id": userId,
    "created_at": createdAt?.millisecondsSinceEpoch,
    "updated_at": updatedAt?.millisecondsSinceEpoch,
  };
}
