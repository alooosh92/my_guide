import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/color_manager.dart';

class BottomNavigationBarDefInf extends StatelessWidget {
  const BottomNavigationBarDefInf({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (controller) => BottomNavigationBar(
        selectedItemColor: ColorManager.primary,
        currentIndex: controller.activepage,
        onTap: (value) => controller.changeActivepage(value, pageController),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.av_timer_outlined), label: ""),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.quick_contacts_dialer_outlined), label: ""),
        ],
      ),
    );
  }
}
