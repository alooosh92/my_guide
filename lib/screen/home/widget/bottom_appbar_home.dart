import 'package:flutter/material.dart';
import 'package:my_guide/screen/home/widget/filter_button_appbar_home.dart';
import 'package:my_guide/screen/home/widget/search_appbar_home.dart';

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
