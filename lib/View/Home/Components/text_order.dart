 import 'package:flutter/material.dart';

Positioned buildTextOrder() {
    return Positioned(
                  top: 30,
                  right: 120,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                          text: "The Fastest In \n Delivery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: ' Food',
                                style: TextStyle(color: Colors.red))
                          ]),
                    ),
                  ),
                );
  }
