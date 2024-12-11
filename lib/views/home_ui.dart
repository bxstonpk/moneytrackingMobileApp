// ignore_for_file: prefer_const_constructors, unnecessary_import, unnecessary_string_interpolations, sized_box_for_whitespace

import 'dart:convert';
import 'dart:typed_data';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:money_tracking_project/environment.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    UserData userData = Get.find();

    Uint8List imageBytes = base64Decode(userData.userImage.value);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: Environment.backgroundColor(context),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  MediaQuery.of(context).size.width * 0.14,
                ),
                bottomRight: Radius.circular(
                  MediaQuery.of(context).size.width * 0.14,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child: Text(
                      '${userData.userFullName.value}',
                      style: TextStyle(
                        color: Environment.textColor(context),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child: ClipOval(
                      child: Image.memory(
                        imageBytes,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.width * 0.17,
                        width: MediaQuery.of(context).size.width * 0.17,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.035,
            right: MediaQuery.of(context).size.width * 0.035,
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.20,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Environment.cardColor(context).withOpacity(1),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'ยอดเงินคงเหลือ',
                    style: TextStyle(
                      color: Environment.textColor(context),
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'xxx',
                    style: TextStyle(
                      color: Environment.textColor(context),
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'ยอดเงินเข้ารวม',
                        style: TextStyle(
                          color: Environment.textColor(context),
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Text(
                        'ยอดเงินออกรวม',
                        style: TextStyle(
                          color: Environment.textColor(context),
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'xxx',
                        style: TextStyle(
                          color: Environment.textColor(context),
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Text(
                        'xxx',
                        style: TextStyle(
                          color: Environment.textColor(context),
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.48,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เงินเข้า/เงินออก',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.050,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Environment.backgroundColor(context),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        FontAwesomeIcons.moneyBillTrendUp,
                        color: Environment.textColor(context),
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        FontAwesomeIcons.house,
                        color: Environment.textColor(context),
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        FontAwesomeIcons.moneyBillTransfer,
                        color: Environment.textColor(context),
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
