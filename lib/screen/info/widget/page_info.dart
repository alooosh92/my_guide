import 'package:flutter/material.dart';
import 'package:my_guide/data/model/medical_center.dart';

class PageInfo extends StatelessWidget {
  const PageInfo({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: medicalCenter.servicesProvided.length,
              itemBuilder: (context, index) {
                return Text(
                  "${index + 1}- ${medicalCenter.servicesProvided[index]}.",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
