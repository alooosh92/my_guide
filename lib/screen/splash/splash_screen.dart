import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/screen/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => Get.offAll(const HomeScreen(),
            duration: const Duration(seconds: 2), transition: Transition.fade));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(child: Image.asset('asset/images/icon.png')),
      ),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: HomeController().getCenters(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Timer(
//                 const Duration(milliseconds: 100),
//                 () => Get.off(const HomeScreen(),
//                     duration: const Duration(seconds: 2),
//                     transition: Transition.fade));
//           }
//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Center(child: Image.asset('asset/images/icon.png')),
//           );
//         },
//       ),
//     );
//   }
// }
