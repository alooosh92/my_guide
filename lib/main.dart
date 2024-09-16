import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_guide/data/binding_manager.dart';
import 'package:my_guide/data/theme_data.dart';
import 'package:my_guide/screen/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeDataDef.themelightData,
      darkTheme: ThemeDataDef.themeDarkData,
      initialBinding: BindingManager(),
      home: const SplashScreen(),
    );
  }
}

ThemeMode getThemeMode() {
  var storage = GetStorage();
  var themeMode = storage.read("themeMode");
  if (themeMode == null) {
    return ThemeMode.system;
  } else if (themeMode == "dark") {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
}
