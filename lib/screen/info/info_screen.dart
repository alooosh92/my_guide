import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/data/model/medical_center.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: 0, keepPage: true);
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        title: const Text('معلومات'),
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 220),
            child: InfoCenterAppBar(medicalCenter: medicalCenter)),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(15),
            topEnd: Radius.circular(15),
          ),
        ),
        child: PageView(
          onPageChanged: (int num) {},
          controller: pageController,
          children: pages,
        ),
      ),
    );
  }
}

List<Widget> pages = const [
  PageInfo(),
  PageDate(),
  PageContactUs(),
];

class InfoCenterAppBar extends StatelessWidget {
  const InfoCenterAppBar({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 40,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicalCenter.name,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      color: ColorManager.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "الجهة: ${medicalCenter.sector}",
                  style: const TextStyle(
                      overflow: TextOverflow.fade,
                      color: ColorManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "التصنيف: ${medicalCenter.filterType}",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      color: ColorManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "النوع: ${medicalCenter.type}",
                  style: const TextStyle(
                      overflow: TextOverflow.fade,
                      color: ColorManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "العنوان: ${medicalCenter.location}",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      color: ColorManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageInfo extends StatelessWidget {
  const PageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PageDate extends StatelessWidget {
  const PageDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.liteGray,
    );
  }
}

class PageContactUs extends StatelessWidget {
  const PageContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
