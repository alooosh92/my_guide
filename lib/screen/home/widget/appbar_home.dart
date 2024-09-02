import 'package:flutter/material.dart';
import 'package:my_guide/screen/home/widget/bottom_appbar_home.dart';

AppBar appBarHome(BuildContext context) {
  return AppBar(
    title: const Text("الصفحة الرئيسية"),
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(context).width, 100),
      child: const BottomAppBarHome(),
    ),
  );
}
