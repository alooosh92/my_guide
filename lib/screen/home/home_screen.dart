import 'package:flutter/material.dart';
import 'package:my_guide/screen/home/widget/appbar_home.dart';
import 'package:my_guide/screen/home/widget/body_home.dart';
import 'package:my_guide/screen/home/widget/bottom_bar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(context),
      bottomNavigationBar: const BottomBarHome(),
      body: const BodyHome(),
    );
  }
}
