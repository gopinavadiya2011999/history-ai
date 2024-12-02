import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';

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
}
