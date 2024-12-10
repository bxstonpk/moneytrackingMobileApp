// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, sort_child_properties_last

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_tracking_project/environment.dart';
import 'package:money_tracking_project/views/home_ui.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  UserData userData = Get.find();

  final TextEditingController _nameCtr = TextEditingController();
  final TextEditingController _birthdayCtr = TextEditingController();
  final TextEditingController _usernameCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
      );

      if (image != null) {
        final File imageFile = File(image.path);

        // readed as base64
        final bytes = await imageFile.readAsBytes();
        final base64Image = base64Encode(bytes);

        userData.setUserImageSelected(base64Image);
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Environment.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: Environment.backgroundColor(context),
        title: Text(
          'ลงทะเบียน',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
          ),
          child: IconButton(
            onPressed: () {
              if (userData.userImageSelected.value != '') {
                userData.clearImageSelected();
              }

              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: MediaQuery.of(context).size.height * 0.04,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                  topRight: Radius.circular(
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ข้อมูลผู้ใช้งาน',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          title: Text(
                            'เลือกตัวเลือก',
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _pickImage(ImageSource.camera);
                              },
                              child: Text(
                                'เปิดกล้อง',
                              ),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _pickImage(ImageSource.gallery);
                              },
                              child: Text(
                                'เลือกจากคลังภาพ',
                              ),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'ยกเลิก',
                            ),
                            isDefaultAction: true,
                          ),
                        );
                      },
                    );
                  },
                  child: Obx(() {
                    return CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.2,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      child: userData.userImageSelected.value == ''
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.userAstronaut,
                                  size:
                                      MediaQuery.of(context).size.width * 0.19,
                                  color: Environment.bottomColor(context),
                                ),
                                Icon(
                                  FontAwesomeIcons.camera,
                                  size:
                                      MediaQuery.of(context).size.width * 0.07,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.2,
                              ),
                              child: Image.memory(
                                base64Decode(userData.userImageSelected.value),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                    );
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: _nameCtr,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      hintText: 'YOUR NAME',
                      labelText: 'ชื่อ-สกุล',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: _birthdayCtr,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      hintText: 'YOUR BIRTHDAY',
                      labelText: 'วัน-เดือน-ปีเกิด',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calendar_today,
                          color: Environment.bottomColor(context),
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: _usernameCtr,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      hintText: 'USERNAME',
                      labelText: 'ชื่อผู้ใช้',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: _passwordCtr,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Environment.bottomColor(context),
                          width: 2.0,
                        ),
                      ),
                      hintText: 'PASSWORD',
                      labelText: 'รหัสผ่าน',
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Environment.bottomColor(context),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      HomeUI(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Environment.bottomColor(context),
                    shadowColor:
                        Environment.bottomColor(context).withOpacity(0.5),
                    elevation: 15,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Center(
                      child: Text(
                        'บันทึกการลงทะเบียน',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
