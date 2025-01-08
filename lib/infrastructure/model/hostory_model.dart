import 'dart:io';

import 'package:flutter/cupertino.dart';

class Category {
  final String id;
  final String name;

  final List<SubCategory> subCategory;

  Category({
    required this.id,
    required this.name,
    required this.subCategory,
  });

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['category']??"",
      subCategory: data['sub_category'] !=null?(data['sub_category'] as List).map((subCat) => SubCategory.fromMap(subCat as Map<String, dynamic>)).toList():[],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': name,
      'sub_category': subCategory.map((subCat) => subCat.toMap()).toList(),
    };
  }
}

class SubCategory {
  final String id;
  bool isSelected;
  final String name;
  final List<User> users;

  SubCategory({required this.id, required this.name, required this.users, this.isSelected = false});

  factory SubCategory.fromMap(Map<String, dynamic> data) {
    return SubCategory(
      id: data['id'],
      name: data['name'],
      users: (data['user'] as List).map((user) => User.fromMap(user as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user': users.map((user) => user.toMap()).toList(),
    };
  }
}

class User {
  final String name;
  final String? photo;
  final String userDesc;
  final String userId;

  User( {required this.name,   this.photo, required this.userDesc,required this.userId,});

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      photo: data['photo'] !=null && data['photo']!=""?data['photo'] :"",
      userDesc: data['user_desc'],
      userId: data['user_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo??"",
      'user_desc': userDesc,
      'user_id': userId,
    };
  }
}

class CatListTextField {
  TextEditingController category;
  List<SubCategoryTextField> subCategory;
  bool isSelected;
  CatListTextField({this.isSelected = true, required this.category, required this.subCategory});
}

class SubCategoryTextField {
  TextEditingController subCategory;
  List<UsersTextField> userTextField;
  bool isSelected;
  SubCategoryTextField({this.isSelected = true, required this.subCategory, required this.userTextField});
}

class UsersTextField {
  TextEditingController userName;
  TextEditingController desc;
  File/*XFile*/? userPhoto;
  bool isSelected;
  UsersTextField({this.isSelected = true, required this.userName, required this.desc, this.userPhoto});
}
