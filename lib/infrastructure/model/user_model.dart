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
  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Handle createdAt and updatedAt as Timestamp or milliseconds
    Timestamp? parseTimestamp(dynamic value) {
      if (value == null) return null;
      if (value is Timestamp) return value;
      if (value is int) return Timestamp.fromMillisecondsSinceEpoch(value);
      throw Exception("Invalid timestamp format: $value");
    }

    return UserModel(
      firstName: json["first_name"] ?? '',
      lastName: json["last_name"] ?? '',
      profilePic: json["profile_pic"] ?? '',
      email: json["email"] ?? '',
      userId: json["user_id"] ?? '',
      password: json["password"] ?? '',
      createdAt: parseTimestamp(json["created_at"]),
      updatedAt: parseTimestamp(json["updated_at"]),
    );
  }

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
