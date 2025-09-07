import 'package:get/get.dart';
import 'package:get_x_demo/app/modules/details/binding/details_binding.dart';
import 'package:get_x_demo/app/modules/details/view/details_view.dart';
import 'package:get_x_demo/app/modules/home/binding/home_binding.dart';
import 'package:get_x_demo/app/modules/home/view/hone_view.dart';

class AppPages{

  static final route = [

    GetPage(name: "/home", page:() => HomeView() ,binding: HomeBinding() ),
    GetPage(name: "/details", page:() => DetailsView() ,binding: DetailsBinding() )

  ];

}