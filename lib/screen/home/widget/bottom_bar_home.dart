import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/screen/about/about_screen.dart';
import 'package:my_guide/screen/home/home_screen.dart';

class BottomBarHome extends StatelessWidget {
  const BottomBarHome({super.key, required this.val});
  final int val;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: val,
      onTap: (ind) {
        if (val != ind && ind == 0) {
          Get.off(const HomeScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 500));
        }
        if (val != ind && ind == 1) {
          Get.to(const AboutScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 500));
        }
        if (val != ind && ind == 2) {
          Get.to(const AboutScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 500));
        }
      },
      selectedItemColor: ColorManager.primary,
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.addressCard),
          label: "",
        ),
        // BottomNavigationBarItem(
        //   icon: FaIcon(FontAwesomeIcons.idBadge),
        //   label: "",
        // ),
      ],
    );
  }
}
