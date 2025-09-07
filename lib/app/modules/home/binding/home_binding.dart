import 'package:get/get.dart';
import 'package:get_x_demo/app/modules/home/controller/home_controller.dart';

class HomeBinding extends Bindings{

  @override
  void dependencies() {
    
    Get.lazyPut<HomeController>(()=> HomeController());
  }

}