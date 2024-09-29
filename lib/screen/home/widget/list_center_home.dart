import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/screen/info/info_screen.dart';

class ListCenterHome extends StatelessWidget {
  const ListCenterHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (controller) => ListView.builder(
        itemCount: controller.centerListFilter.length,
        itemBuilder: (context, index) {
          IconData nameIcon = FontAwesomeIcons.hospital;
          String servicesProvided = "";
          for (var element
              in controller.centerListFilter[index].servicesProvided) {
            if (servicesProvided.isEmpty) {
              servicesProvided += element;
            } else {
              servicesProvided += " - $element";
            }
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: () => Get.to(InfoScreen(
                  medicalCenter: controller.centerListFilter[index])),
              child: Container(
                width: MediaQuery.sizeOf(context).width - 20,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: ColorManager.primary),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 3), color: ColorManager.darkGray),
                    BoxShadow(
                        offset: Offset(-1, 3), color: ColorManager.darkGray),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(nameIcon),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width - 80,
                            child: Text(
                              controller.centerListFilter[index].name,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "النوع: ${controller.centerListFilter[index].type}",
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "القطاع: ${controller.centerListFilter[index].sector}",
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "العنوان: ${controller.centerListFilter[index].location}",
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "الخدمات المقدمة: $servicesProvided",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
