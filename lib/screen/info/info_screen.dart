import 'package:flutter/material.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/data/model/medical_center.dart';
import 'package:my_guide/screen/info/widget/appbar_info.dart';
import 'package:my_guide/screen/info/widget/bottom_navigation_bar_def_inf.dart';
import 'package:my_guide/screen/info/widget/page_contact_us.dart';
import 'package:my_guide/screen/info/widget/page_date.dart';
import 'package:my_guide/screen/info/widget/page_info.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: 0, keepPage: true);

    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: appbarInfo(context, medicalCenter),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton.small(
      //     backgroundColor: Colors.transparent,
      //     onPressed: () async {
      //       if (await canLaunchUrlString(medicalCenter.mapLocation)) {
      //         launchUrlString(medicalCenter.mapLocation);
      //       }
      //     },
      //     child: Image.asset(
      //       'asset/images/map.png',
      //       fit: BoxFit.fill,
      //     )),
      bottomNavigationBar: BottomNavigationBarDefInf(
        pageController: pageController,
        medicalCenter: medicalCenter,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/icon3.png'), opacity: 0.1),
          color: ColorManager.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(15),
            topEnd: Radius.circular(15),
          ),
        ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int num) {},
          controller: pageController,
          children: pages(medicalCenter),
        ),
      ),
    );
  }
}

List<Widget> pages(MedicalCenter medicalCenter) => [
      PageInfo(medicalCenter: medicalCenter),
      PageDate(medicalCenter: medicalCenter),
      PageContactUs(medicalCenter: medicalCenter),
    ];
