import 'package:get/get.dart';
import 'package:my_guide/controller/home_controller.dart';

class BindingManager implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
