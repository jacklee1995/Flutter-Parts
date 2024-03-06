import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'app/injections.dart';

import 'app/router.dart';
import 'modules/index/index_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetitInjection.init();
  await GetIt.instance.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      home: const IndexView(),
    );
  }
}
