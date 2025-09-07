import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_demo/app/data/services/storage_services.dart';
import 'package:get_x_demo/app/routes/routes.dart';

void main() async {
  // init getStorage
  await GetStorage.init();
  await _initServices();

  runApp(MyApp());
}

Future<void> _initServices() async {
  await Get.putAsync<StorageServices>(() async => StorageServices());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: AppPages.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
