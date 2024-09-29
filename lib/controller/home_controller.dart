import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_guide/data/model/medical_center.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeController extends GetxController {
  int filterButton = 0;
  int activepage = 0;
  List<MedicalCenter> centerListFilter = [];
  List<MedicalCenter> centerList = [];
  static List<String> listCatecory = [
    "الكل",
    "الخدمات الصحية",
    "الخدمات المدنية للمجالس المحلية",
    "الخدمات التعليمية",
    "الخدمات المدنية",
    "الخدمات القانونية"
  ];

  Future<void> getCenters() async {
    //"https://drive.google.com/uc?export=view&id=1PNYIxvkxaG87sf0Rmdpaa5HBOozubnED"zakor
    //"https://drive.google.com/uc?export=view&id=1Xnhep_BN6RVeXzvT6EQNOsJA-HUD4mry"alosh
    var storage = GetStorage();
    http.Response response = await http
        .get(Uri.parse(
            "https://drive.google.com/uc?export=view&id=1PNYIxvkxaG87sf0Rmdpaa5HBOozubnED"))
        .onError(
      (error, stackTrace) {
        var data = storage.read("data");
        if (data != null) {
          List<MedicalCenter> list = [];
          try {
            for (var element in data) {
              list.add(MedicalCenter.fromJson(element));
            }
            centerList = list;
            centerListFilter = list;
            update();
          } catch (e) {
            // ignore: avoid_print
            print(e);
          }
        }
        return http.Response("No internet", 400);
      },
    );
    if (response.statusCode == 200) {
      storage.write("data", json.decode(utf8.decode(response.bodyBytes)));
      List<MedicalCenter> list = [];
      try {
        var body = json.decode(utf8.decode(response.bodyBytes));
        for (var element in body) {
          list.add(MedicalCenter.fromJson(element));
        }
        centerList = list;
        centerListFilter = list;
        update();
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  void searchItem(text) {
    if (text == "") {
      centerListFilter = centerList;
    } else {
      centerListFilter = centerList
          .where((element) =>
              element.location.contains(text) ||
              element.name.contains(text) ||
              element.type.contains(text) ||
              element.sector.contains(text) ||
              element.location.contains(text) ||
              element.servicesProvided
                  .where(
                    (serv) => serv.contains(text),
                  )
                  .isNotEmpty)
          .toList();
    }
    update();
  }

  void searchFilter(int i) {
    filterButton = i;
    String text = listCatecory[i];
    if (text == "الكل") {
      centerListFilter = centerList;
    } else {
      centerListFilter = centerList
          .where((element) => element.filterType == listCatecory[i])
          .toList();
    }
    update();
  }

  void changeActivepage(
    int page,
    PageController pageController,
  ) {
    switch (page) {
      case 0:
        {
          pageController.animateToPage(page,
              curve: Curves.ease, duration: const Duration(seconds: 1));
          activepage = page;
          update();
        }
      case 2:
        {
          pageController.animateToPage(1,
              curve: Curves.ease, duration: const Duration(seconds: 1));
          activepage = page;
          update();
        }
    }
  }

  Future<Widget> getConection(String type, String val) async {
    switch (type) {
      case "Phone":
        return IconButtonContact(
          icon: FontAwesomeIcons.phone,
          text: val,
          url: "tel:$val",
        );
      case "Mobile":
        return IconButtonContact(
          icon: FontAwesomeIcons.mobile,
          text: val,
          url: "tel:$val",
        );
      case "Email":
        return IconButtonContact(
          icon: FontAwesomeIcons.envelope,
          text: val,
          url: "mailto:$val",
        );
      case "Whatsapp":
        return IconButtonContact(
          icon: FontAwesomeIcons.whatsapp,
          text: val,
          url: "https://wa.me/$val",
        );
      case "Telegram":
        return IconButtonContact(
          icon: FontAwesomeIcons.telegram,
          text: val,
          url: "https://t.me/user_name",
        );
      case "FaceBook":
        return IconButtonContact(
          icon: FontAwesomeIcons.facebook,
          text: val,
          url: "fb://page/$val",
        );
      case "Instagram":
        return IconButtonContact(
          icon: FontAwesomeIcons.instagram,
          text: val,
          url: "https://www.instagram.com/$val/",
        );
      default:
        return IconButton(
            onPressed: () {}, icon: const Icon(Icons.contact_emergency));
    }
  }
}

class IconButtonContact extends StatelessWidget {
  const IconButtonContact({
    super.key,
    required this.url,
    required this.icon,
    required this.text,
  });
  final String url;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if (await canLaunchUrlString(url)) {
            await launchUrlString(url);
          }
        },
        icon: Row(
          children: [
            FaIcon(icon),
            const SizedBox(width: 10),
            Text(
              text,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ],
        ));
  }
}
