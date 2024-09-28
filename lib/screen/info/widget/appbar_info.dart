import 'package:flutter/material.dart';
import 'package:my_guide/data/model/medical_center.dart';
import 'package:my_guide/screen/info/widget/info_center_app_bar.dart';

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
