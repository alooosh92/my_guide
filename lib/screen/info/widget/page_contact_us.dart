import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/model/medical_center.dart';

class PageContactUs extends StatelessWidget {
  const PageContactUs({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return snapshot.data!;
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
