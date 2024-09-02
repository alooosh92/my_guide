import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';

class SearchAppBarHome extends StatelessWidget {
  const SearchAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SearchBar(
        hintText: "يحث",
        onChanged: (text) => homeController.searchItem(text),
        elevation: const WidgetStatePropertyAll(20),
        leading: const Icon(Icons.search),
      ),
    );
  }
}
