// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:money_tracking_project/environment.dart';
import 'package:money_tracking_project/views/introduction_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAll(
          IntroductionUI(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Environment.backgroundColor(context),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Money Tracking',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Environment.textColor(context),
                  ),
                ),
                Text(
                  'รายรับรายจ่ายของฉัน',
                  style: TextStyle(
                    fontSize: 20,
                    color: Environment.textColor(context),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Created by 6419410031',
                      style: TextStyle(
                        fontSize: 18,
                        color: Environment.textColor(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'IoT-SAU',
                      style: TextStyle(
                        fontSize: 18,
                        color: Environment.textColor(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.17,
              right: MediaQuery.of(context).size.width * 0.20,
              left: MediaQuery.of(context).size.width * 0.20,
              child: CircularProgressIndicator(
                color: Environment.textColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
