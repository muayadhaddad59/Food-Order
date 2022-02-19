import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Home/home_screen.dart';
import '../NAV_Bar/nav.dart';
import 'Components/build_button.dart';
import 'Components/curved.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  var pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg.jpg"))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/chef.png"),
          ),
          buildCardPageView(),
        ],
      ),
    );
  }

  Align buildCardPageView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 300,
        child: buildView(),
      ),
    );
  }

  PageView buildView() {
    return PageView(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.white,
              child: RichText(
                text: const TextSpan(
                  text: 'The Fastest In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(text: "\nDelivery"),
                    TextSpan(
                      text: ' Food',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                  text:
                      'our job is to filling your tummy with \n delicious food and fast delivery.',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageViewController,
                  count: 2,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.orangeAccent,
                      expansionFactor: 2,
                      dotHeight: 10,
                      spacing: 5),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildOwnButton(
              "Get Started",
              () {
                Get.to(NavBar());
              },
            ),
          ],
        ),
      ],
    );
  }
}
