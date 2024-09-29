import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/data/model/medical_center.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BottomNavigationBarDefInf extends StatelessWidget {
  const BottomNavigationBarDefInf(
      {super.key, required this.pageController, required this.medicalCenter});
  final PageController pageController;
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (controller) => BottomNavigationBar(
        selectedFontSize: 0,
        selectedItemColor: ColorManager.primary,
        currentIndex: controller.activepage,
        onTap: (value) => controller.changeActivepage(value, pageController),
        iconSize: 35,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () async {
                  if (await canLaunchUrlString(medicalCenter.mapLocation)) {
                    launchUrlString(medicalCenter.mapLocation);
                  }
                },
                child: Image.asset(
                  'asset/images/map.png',
                  fit: BoxFit.fill,
                  height: 35,
                  width: 35,
                ),
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.av_timer_outlined), label: ""),
        ],
      ),
    );
  }
}
