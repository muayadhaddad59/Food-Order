import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Model/Data/PopularNow/popular_data.dart';
import '../../Details/details_page.dart';

class BuildPopularNowItems extends StatelessWidget {
  const BuildPopularNowItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(DetailsPage(
                    desc: listPopularNow[index].desc,
                    label: listPopularNow[index].label,
                    price: listPopularNow[index].price,
                    imagePath: listPopularNow[index].imagePath,
                  ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    height: 59,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Image.asset(
                          listPopularNow[index].imagePath,
                          fit: BoxFit.contain,
                          height: 100,
                        ),
                        Text(
                          listPopularNow[index].label,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        Text(
                          listPopularNow[index].desc,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("\$",
                                style: TextStyle(color: Colors.red)),
                            Text(
                              listPopularNow[index].price.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemCount: listPopularNow.length),
      ),
    );
  }
}
