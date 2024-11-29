import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

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
      name: data['name'],
      subCategory: (data['sub_cat'] as List).map((subCat) => SubCategory.fromMap(subCat as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sub_cat': subCategory.map((subCat) => subCat.toMap()).toList(),
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
      users: (data['users'] as List).map((user) => User.fromMap(user as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users.map((user) => user.toMap()).toList(),
    };
  }
}

class User {
  final String name;
  final String photo;
  final String userDesc;

  User({required this.name, required this.photo, required this.userDesc});

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      photo: data['photo'],
      userDesc: data['user_desc'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'user_desc': userDesc,
    };
  }
}

class CatListTextField {
  TextEditingController category;
  List<SubCategoryTextField> subCategory;
  bool isSelected;
  CatListTextField({this.isSelected = false, required this.category, required this.subCategory});
}

class SubCategoryTextField {
  TextEditingController subCategory;
  List<UsersTextField> userTextField;
  bool isSelected;
  SubCategoryTextField({this.isSelected = false, required this.subCategory, required this.userTextField});
}

class UsersTextField {
  TextEditingController userName;
  TextEditingController desc;
  XFile? userPhoto;
  bool isSelected;
  UsersTextField({this.isSelected = false, required this.userName, required this.desc, this.userPhoto});
}
