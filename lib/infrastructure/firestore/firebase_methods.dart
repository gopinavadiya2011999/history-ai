import 'dart:convert';
import 'dart:developer';
import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_ai/infrastructure/constant/common_toast.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/infrastructure/model/place_model.dart';
import 'package:history_ai/infrastructure/model/user_model.dart';

class FirebaseMethods {
  static Future<void> writeData(List<Category> categories, BuildContext context) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();

    try {
      for (var category in categories) {
        final docRef = firestore.collection("categories").doc(category.id);

        Map<String, dynamic> data = {
          "category": category.name,
          "id": category.id,
          "sub_category": category.subCategory.map((subCat) {
            return {
              "id": subCat.id,
              "name": subCat.name,
              "user": subCat.users.map((user) => user.toMap()).toList(),
            };
          }).toList(),
        };

        batch.set(
          docRef,
          data,
          SetOptions(merge: true),
        );
      }
      await batch.commit();
      print("Data written successfully!");
    } catch (e) {
      print("Error writing data: $e");
    }
  }

  static Future<UserModel?> getLoginUserDetail({
    required String email,
    required BuildContext context,
    required String password,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isEmpty) {
        showTopToast(msg: "Email not found.", context: context);
        return null;
      }

      final userDoc = querySnapshot.docs.first;
      final hashedPassword = userDoc['password'];
      bool isPasswordMatched = BCrypt.checkpw(password, hashedPassword);

      if (isPasswordMatched) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      } else {
        showTopToast(msg: "Incorrect password.", context: context);
        return null;
      }
    } catch (e) {
      print("Error fetching user details: $e");
      showTopToast(msg: "Something went wrong. Please try again.", context: context);
      return null;
    }
  }

  static Future<bool> registerUser({
    required UserModel userData,
    required BuildContext context,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();

    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection("users")
          .where("email", isEqualTo: userData.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        showTopToast(msg: "Email is already exists.", context: context);
        return false;
      }
      final docRef = firestore.collection("users").doc(userData.userId);

      batch.set(
        docRef,
        userData.toJson(),
        SetOptions(merge: true),
      );

      await batch.commit();
      print("Data written successfully!");

      return true;
    } catch (e) {
      print("Error writing data: $e");
      showTopToast(msg: "Error registering user. Please try again.", context: context);
      return false;
    }
  }

  static Future<void> writePLacesData(List<Places> categories, BuildContext context) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();

    try {
      for (var category in categories) {
        final docRef = firestore.collection("placeCategories").doc(category.id);

        Map<String, dynamic> data = {
          "category": category.category,
          "id": category.id,
          "sub_category": category.subCategory!.map((subCat) {
            return {
              "id": subCat.id,
              "name": subCat.name,
              "city": subCat.city!.map((user) => user.toJson()).toList(),
            };
          }).toList(),
        };

        batch.set(
          docRef,
          data,
          SetOptions(merge: true),
        );
      }
      await batch.commit();
      print("Data written successfully!");
    } catch (e) {
      print("Error writing data: $e");
    }
  }

  static Future<List<Category>?> fetchAllCategories() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      List<Category> categories = [];
      QuerySnapshot querySnapshot = await firestore.collection("categories").get();
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        categories.add(Category.fromMap(data));
      }

      return categories;
    } catch (e) {
      log("Error fetching all categories: $e");
      return null;
    }
  }

  static Future<List<Places>?> fetchAllPlaceCategories() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      List<Places> places = [];
      QuerySnapshot querySnapshot = await firestore.collection("placeCategories").get();
      log("jsonEncodeData ==>${jsonEncode(querySnapshot.docs.first.data())}");
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        places.add(Places.fromJson(data));
      }
      log("jsonEncodeData place subcategory data ==>${places.first.subCategory!.first.name}");

      return places;
    } catch (e) {
      log("Error fetching all categories: $e");
      return null;
    }
  }
}
