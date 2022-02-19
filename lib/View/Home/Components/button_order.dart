  import 'package:flutter/material.dart';

Positioned buildButtonOrder() {
    return Positioned(
                  top: 80,
                  right: 200,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: const Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                );
  }