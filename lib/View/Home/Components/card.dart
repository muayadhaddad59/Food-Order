 import 'dart:ui';

import 'package:flutter/material.dart';

ClipRRect buildCard() {
    return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                    child: Image.asset(
                      "assets/images/bg.jpg",
                      fit: BoxFit.cover,
                      width: 500,
                    ),
                  ),
                );
  }
