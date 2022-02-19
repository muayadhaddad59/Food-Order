import 'package:flutter/material.dart';
import 'package:food_order/Controller/categories_controller.dart';
import 'package:food_order/Model/Data/PopularNow/popular_data.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../Model/Data/Categories/categories_data.dart';
import 'Components/appbar.dart';
import 'Components/card.dart';
import 'Components/deliver_man.dart';
import 'Components/button_order.dart';
import 'Components/popular_now.dart';
import 'Components/text_order.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                ),
                height: size.height * 0.25,
                width: size.width * 1,
                child: Stack(
                  children: [
                    buildCard(),
                    buildTextOrder(),
                    buildButtonOrder(),
                    buildDeliveryMan(),
                  ],
                ),
              ),
            ),
            buildNameCat("Categories"),
            const SizedBox(
              height: 20,
            ),
            const BuildCategories(),
            const SizedBox(
              height: 20,
            ),
            buildRowPopular(),
           const  BuildPopularNowItems(),
            const SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }

  Row buildRowPopular() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildNameCat("Popular Now"),
        TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.only(top: 18, right: 12))),
          onPressed: () {},
          child: Row(
            children: const [
              Text(
                "View All",
                style: TextStyle(color: Colors.orangeAccent),
              ),
              Icon(
                Icons.arrow_right_sharp,
                color: Colors.orangeAccent,
              )
            ],
          ),
        ),
      ],
    );
  }

  Container buildNameCat(String label) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20),
      alignment: Alignment.topLeft,
      child: Text(
        label,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class BuildCategories extends StatelessWidget {
  const BuildCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      width: double.infinity,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GetBuilder<CategoriesController>(
              init: CategoriesController(),
              builder: (value) {
                return GestureDetector(
                  onTap: () {
                    value.changeActice(index);
                  },
                  child: Container(
                    width: 140,
                    decoration: BoxDecoration(
                        color: value.selectedIndex != null &&
                                value.selectedIndex == index
                            ? Colors.red
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          listCategories[index].imagePath,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          listCategories[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: value.selectedIndex != null &&
                                      value.selectedIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
