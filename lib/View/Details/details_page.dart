import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_order/Controller/details_controller.dart';
import 'package:food_order/Model/Data/PopularNow/popular_model.dart';
import 'package:get/get.dart';

import '../start_page/Components/build_button.dart';

class DetailsPage extends StatelessWidget {
  final String label;
  final String desc;
  final double price;
  final String imagePath;
  const DetailsPage(
      {Key? key,
      required this.label,
      required this.desc,
      required this.price,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 6, sigmaX: 6),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          buildIcons(Icons.arrow_back_ios_new, () {
            Get.back();
          }, Alignment.topLeft),
          buildIcons(Icons.dashboard_outlined, () {}, Alignment.topRight),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    height: 170,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<DetailsController>(
                      init: DetailsController(),
                      builder: (value) {
                        return Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red),
                          child: buildQuantinty(value),
                        );
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  buildLabelDescPrice(),
                  buildTimer(),
                  buildDesc(),
                  const SizedBox(
                    height: 30,
                  ),
                  buildOwnButton(
                    "Add To Cart",
                    () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildDesc() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        textAlign: TextAlign.left,
        text: const TextSpan(
            text:
                "This beef burger uses 100% quality beef with\n sliced tomatoes, cucmbers, vegetables\n and onions...",
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(text: "Read More", style: TextStyle(color: Colors.red))
            ]),
      ),
    );
  }

  Padding buildTimer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildKaclTimer("assets/images/star.png", "4,8"),
          buildKaclTimer("assets/images/fire.png", "150 Kacl"),
          buildKaclTimer("assets/images/timer.png", "5-10 min"),
        ],
      ),
    );
  }

  Row buildKaclTimer(String image, String label) {
    return Row(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          height: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 17),
        )
      ],
    );
  }

  Padding buildLabelDescPrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                desc,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "\$",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                price.toString(),
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  Row buildQuantinty(DetailsController value) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            value.decrement();
          },
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Text(
          value.number.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        TextButton(
          onPressed: () {
            value.increment();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding buildIcons(
      IconData icon, VoidCallback press, AlignmentGeometry alignmentGeometry) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Align(
        alignment: alignmentGeometry,
        child: IconButton(
            color: Colors.white,
            onPressed: press,
            icon: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Icon(
                icon,
                color: Colors.black,
                size: 20,
              ),
            )),
      ),
    );
  }
}
