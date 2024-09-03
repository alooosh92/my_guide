import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
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
      appBar: appbarInfo(context, medicalCenter),
      bottomNavigationBar:
          BottomNavigationBarDefInf(pageController: pageController),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.quick_contacts_dialer_outlined), label: ""),
        ],
      ),
    );
  }
}

AppBar appbarInfo(BuildContext context, MedicalCenter medicalCenter) {
  return AppBar(
    title: const Text('معلومات'),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset('asset/images/icon2.png'),
      )
    ],
    bottom: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 220),
        child: InfoCenterAppBar(medicalCenter: medicalCenter)),
  );
}

List<Widget> pages(MedicalCenter medicalCenter) => [
      PageInfo(medicalCenter: medicalCenter),
      PageDate(medicalCenter: medicalCenter),
      PageContactUs(medicalCenter: medicalCenter),
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
  const PageInfo({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text(
            ":الخدمات المقدمة",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const Divider(
            height: 30,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: medicalCenter.servicesProvided.length,
            itemBuilder: (context, index) {
              return Text(
                "${index + 1}- ${medicalCenter.servicesProvided[index]}.",
                overflow: TextOverflow.fade,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PageDate extends StatelessWidget {
  const PageDate({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "اوقات الدوام",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Divider(height: 30),
          Text(
            "السبت: ${medicalCenter.workingHours[0]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "الأحد: ${medicalCenter.workingHours[1]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "الإثنين: ${medicalCenter.workingHours[2]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "الثلاثاء: ${medicalCenter.workingHours[3]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "الأربعاء: ${medicalCenter.workingHours[4]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "الخميس: ${medicalCenter.workingHours[5]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "الجمعة: ${medicalCenter.workingHours[6]}",
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class PageContactUs extends StatelessWidget {
  const PageContactUs({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "معلومات الإتصال",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Divider(height: 30),
          GetBuilder<HomeController>(
            init: homeController,
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              itemCount: medicalCenter.contactInformation.length,
              itemBuilder: (context, index) {
                return FutureBuilder<Widget>(
                    future: controller.getConection(
                        medicalCenter.contactInformation[index].type,
                        medicalCenter.contactInformation[index].value),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!;
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
