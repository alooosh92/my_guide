import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_guide/data/model/medical_center.dart';

class HomeController extends GetxController {
  int filterButton = 0;
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
    http.Response response = await http.get(Uri.parse(
        "https://drive.google.com/uc?export=view&id=1Xnhep_BN6RVeXzvT6EQNOsJA-HUD4mry"));
    if (response.statusCode == 200) {
      List<MedicalCenter> list = [];
      try {
        var body = json.decode(utf8.decode(response.bodyBytes));
        for (var element in body['MedicalCenter']) {
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
}
