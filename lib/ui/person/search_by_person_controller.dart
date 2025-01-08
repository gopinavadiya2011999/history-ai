import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/infrastructure/model/place_model.dart';

class SearchByPersonController extends GetxController {
  List<Category> categoryList = [];
  List<Places> placeList = [];
  Category? selectedCategory;
  Places? selectedPlace;
  RxBool isLoading = false.obs;
  RxBool isHistorySelected = true.obs;
  RxBool isPlaceSelected = true.obs;
  TextEditingController categoryController = TextEditingController();

  User? selectedUser ;
  City? selectedCity;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();


  @override
  void onInit() {
    fetchDataFromFirestore();
    super.onInit();
  }

  fetchDataFromFirestore() {
    try {
      if (categoryList.isEmpty) {
        isLoading = true.obs;
        update();
      }
      FirebaseMethods.fetchAllCategories().then(
        (value) {
          if (value != null) {
            categoryList = value;
            selectedCategory = categoryList.first;
          }
          update();
        },
      );
    } catch (error) {
      log("<<---error--->> $error");
    } finally {
      isLoading = false.obs;
      update();
    }
  }

  fetchPlaceDataFromFirestore() {
    try {
      if (placeList.isEmpty) {
        isLoading = true.obs;
        update();
      }
      FirebaseMethods.fetchAllPlaceCategories().then((value) {
        if (value != null) {
          placeList = value;
          selectedPlace = placeList.first;
        }
        update();
      },);

    } catch (error) {
      log("<<---error--->> $error");
    } finally {
      isLoading = false.obs;
      update();
    }
  }
}
