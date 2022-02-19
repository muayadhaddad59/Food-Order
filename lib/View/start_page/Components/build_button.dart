import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../NAV_Bar/nav.dart';


ElevatedButton buildOwnButton(String label , VoidCallback press) {
    return ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size(90, 50),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            onPressed:press,
            child:  Padding(
              padding:const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                label,
                style:const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
          );
  }