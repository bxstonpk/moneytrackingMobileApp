// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracking_project/models/user.dart';

class Environment {
  static Color bottomColor(BuildContext context) {
    return Color(0xFF49968D);
  }

  static Color backgroundColor(BuildContext context) {
    return Color.fromARGB(255, 53, 126, 117);
  }

  static Color cardColor(BuildContext context) {
    return Color.fromARGB(255, 7, 111, 99);
  }

  static Color textColor(BuildContext context) {
    return Colors.white;
  }

  static String apiURL = 'http://127.0.0.1/moneytrackingservice/apis';

  static User? user;
}

class UserData extends GetxController {
  var _message = ''.obs;
  var _userId = 0.obs;
  var userFullName = ''.obs;
  var userBirthDate = ''.obs;
  var userName = ''.obs;
  RxString userImage = ''.obs; // For the image from the database
  RxString userImageSelected = ''.obs; // For the image picker

  void clear() {
    _message.value = '';
    _userId.value = 0;
    userFullName.value = '';
    userBirthDate.value = '';
    userName.value = '';
    userImage.value = '';
    userImageSelected.value = '';
  }

  void clearImageSelected() {
    userImageSelected.value = '';
  }

  void setUserId(int value) async {
    _userId.value = value;
  }

  void setUserFullName(String value) {
    userFullName.value = value;
  }

  void setUserBirthDate(String value) {
    userBirthDate.value = value;
  }

  void setUserName(String value) {
    userName.value = value;
  }

  void setUserImage(String value) {
    userImage.value = value;
  }

  int getUserId() {
    return _userId.value;
  }

  String getUserFullName() {
    return userFullName.value;
  }

  String getUserBirthDate() {
    return userBirthDate.value;
  }

  String getUserName() {
    return userName.value;
  }

  String getUserImage() {
    return userImage.value;
  }

  void setUserImageSelected(String value) {
    userImageSelected.value = value;
  }
}
