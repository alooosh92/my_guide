import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/color_manager.dart';

class FilterButtonAppBarHome extends StatelessWidget {
  const FilterButtonAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: GetBuilder(
        init: homeController,
        builder: (controller) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: HomeController.listCatecory.length,
          itemBuilder: (context, index) {
            return TextButton(
              style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 3))),
              onPressed: () => homeController.searchFilter(index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: homeController.filterButton != index
                        ? ColorManager.white
                        : ColorManager.darkGray),
                child: Text(
                  HomeController.listCatecory[index],
                  style: TextStyle(
                      color: homeController.filterButton != index
                          ? Colors.black
                          : ColorManager.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
