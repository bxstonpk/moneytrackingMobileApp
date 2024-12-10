// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracking_project/environment.dart';
import 'package:money_tracking_project/models/user.dart';
import 'package:money_tracking_project/services/call_api.dart';
import 'package:money_tracking_project/views/home_ui.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  UserData userData = Get.find();

  final TextEditingController _usernameCtr =
      TextEditingController(text: 'mwelden4');
  final TextEditingController _passwordCtr =
      TextEditingController(text: 'vH2&i2NI1!Gyg6N4');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Environment.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: Environment.backgroundColor(context),
        title: Text(
          'เข้าใช้งาน Money Tracking',
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
                Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                      labelText: 'ชื่อผู้ใข้',
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
                    if (_usernameCtr.text.trim().isEmpty) {
                      Get.snackbar(
                        'แจ้งเตือน',
                        'กรุณากรอกชื่อผู้ใช้',
                        backgroundColor: Colors.red.withOpacity(0.7),
                        colorText: Colors.white,
                      );
                    } else if (_passwordCtr.text.trim().isEmpty) {
                      Get.snackbar(
                        'แจ้งเตือน',
                        'กรุณากรอกรหัสผ่าน',
                        backgroundColor: Colors.red.withOpacity(0.7),
                        colorText: Colors.white,
                      );
                    } else {
                      User user = User(
                        userName: _usernameCtr.text.trim(),
                        userPassword: _passwordCtr.text.trim(),
                      );

                      CallApi.checkLoginAPI(user).then((value) {
                        if (value[0].message == '1') {
                          userData.setUserId(value[0].userId ?? 0);
                          userData.setUserFullName(value[0].userFullName ?? '');
                          userData
                              .setUserBirthDate(value[0].userBirthDate ?? '');
                          userData.setUserName(value[0].userName ?? '');
                          userData.setUserImage(value[0].userImage ?? '');

                          Get.defaultDialog(
                            title: 'แจ้งเตือน',
                            titleStyle: TextStyle(
                              color: Environment.bottomColor(context),
                              fontWeight: FontWeight.bold,
                            ),
                            content: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  'เข้าสู่ระบบสำเร็จ',
                                  style: TextStyle(
                                    color: Environment.bottomColor(context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.offAll(
                                      HomeUI(),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Environment.bottomColor(context),
                                    shadowColor:
                                        Environment.bottomColor(context)
                                            .withOpacity(0.5),
                                    elevation: 15,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: Center(
                                      child: Text(
                                        'เข้าสู่ระบบ',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ],
                            ),
                          );
                        } else {
                          Get.snackbar(
                            'แจ้งเตือน',
                            'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง',
                            backgroundColor: Colors.red.withOpacity(0.7),
                            colorText: Colors.white,
                          );
                        }
                      });
                    }
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
                        'เข้าใช้งาน',
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
