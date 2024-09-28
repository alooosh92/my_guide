import 'package:flutter/material.dart';
import 'package:my_guide/data/model/medical_center.dart';

class PageDate extends StatelessWidget {
  const PageDate({super.key, required this.medicalCenter});
  final MedicalCenter medicalCenter;
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
