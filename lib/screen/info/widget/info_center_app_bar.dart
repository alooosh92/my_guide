import 'package:flutter/material.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/data/model/medical_center.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 40,
                      child: Text(
                        medicalCenter.name,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            color: ColorManager.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
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
                TextButton(
                  onPressed: () async {
                    if (await canLaunchUrlString(medicalCenter.mapLocation)) {
                      launchUrlString(medicalCenter.mapLocation);
                    }
                  },
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
                  child: Text(
                    "العنوان: ${medicalCenter.location}",
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        color: ColorManager.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
