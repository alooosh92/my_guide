import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_guide/data/color_manager.dart';

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
