// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:money_tracking_project/environment.dart';
import 'package:money_tracking_project/views/login_ui.dart';
import 'package:money_tracking_project/views/register_ui.dart';

class IntroductionUI extends StatefulWidget {
  const IntroductionUI({super.key});

  @override
  State<IntroductionUI> createState() => _IntroductionUIState();
}

class _IntroductionUIState extends State<IntroductionUI> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              child: Image.asset(
                'assets/images/bg.png',
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              right: MediaQuery.of(context).size.width * 0.14,
              child: Image.asset(
                'assets/images/money.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                  ),
                  Text(
                    'บันทึก',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.037,
                      fontWeight: FontWeight.bold,
                      color: Environment.backgroundColor(context),
                    ),
                  ),
                  Text(
                    'รายรับรายจ่าย',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.037,
                      fontWeight: FontWeight.bold,
                      color: Environment.backgroundColor(context),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(
                        LoginUI(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Environment.bottomColor(context),
                      shadowColor: Environment.bottomColor(context),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Center(
                        child: Text(
                          'เริ่มใข้งานแอปพลิเคชัน',
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
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ยังไม่ได้ลงทะเบียน?',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            RegisterUI(),
                          );
                        },
                        child: Text(
                          'ลงทะเบียน',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              color: Environment.bottomColor(context)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
