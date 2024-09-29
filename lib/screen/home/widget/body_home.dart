import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/screen/home/widget/list_center_home.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return FutureBuilder(
      future: homeController.getCenters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done ||
            homeController.centerList.isNotEmpty) {
          return const ListCenterHome();
        }
        return const Center(
          child: Text("لا يوجد بيانات لعرضها"),
        );
      },
    );
  }
}
