import 'package:flutter/material.dart';


 AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Image.asset(
        "assets/images/menu.png",
        height: 1,
      ),
      actions: [
        Image.asset(
          "assets/images/man.png",
          height: 1,
        )
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.location_pin,
            color: Colors.red,
          ),
          Text(
            "California,US",
            style: TextStyle(color: Colors.black , fontSize: 12),
          ),
          Icon(Icons.arrow_drop_down , color: Colors.yellow,)
        ],
      ),
    );
  }