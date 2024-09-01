import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';
import 'package:my_guide/data/color_manager.dart';

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

AppBar appBarHome(BuildContext context) {
  return AppBar(
    title: const Text("الصفحة الرئيسية"),
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(context).width, 100),
      child: const BottomAppBarHome(),
    ),
  );
}

class BottomAppBarHome extends StatelessWidget {
  const BottomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchAppBarHome(),
        FilterButtonAppBarHome(),
      ],
    );
  }
}

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

class BottomBarHome extends StatelessWidget {
  const BottomBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorManager.primary,
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circleInfo),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.personMilitaryToPerson),
          label: "",
        ),
      ],
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return FutureBuilder(
      future: homeController.getCenters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const ListCenterHome();
        }
        return const Center(
          child: Text("لا يوجد بيانات لعرضها"),
        );
      },
    );
  }
}

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
            child: Container(
              width: MediaQuery.sizeOf(context).width - 20,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: ColorManager.primary),
                boxShadow: const [
                  BoxShadow(offset: Offset(1, 3), color: ColorManager.darkGray),
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
                        Text(
                          controller.centerListFilter[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
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
          );
        },
      ),
    );
  }
}

class FilterButtonAppBarHome extends StatelessWidget {
  const FilterButtonAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: GetBuilder(
        init: homeController,
        builder: (controller) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: HomeController.listCatecory.length,
          itemBuilder: (context, index) {
            return TextButton(
              style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 3))),
              onPressed: () => homeController.searchFilter(index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: homeController.filterButton != index
                        ? ColorManager.white
                        : ColorManager.darkGray),
                child: Text(
                  HomeController.listCatecory[index],
                  style: TextStyle(
                      color: homeController.filterButton != index
                          ? Colors.black
                          : ColorManager.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
