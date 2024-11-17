import 'package:flutter/material.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/cart%20controller/cart_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/category_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/fav_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/views/Custom%20Widgets/my_theme.dart';
import 'package:flutterfastfoodwithgetxusingapi/views/homeview/homeview.dart';
import 'package:flutterfastfoodwithgetxusingapi/views/onBoarding/onboading_screen.dart';
import 'package:get/get.dart';

import 'controllers/onboarding_controller.dart';

void main() {
  runApp(const MyApp(),);
  CategoryController categoryController = Get.put(CategoryController(),);
  CartController cartController =Get.put(CartController(),);
  FavController favController = Get.put(FavController(),);
  OnBoardingController onBoardingController = Get.put(OnBoardingController (),);


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter FastFood App With Getx Using Api',
      themeMode: ThemeMode.system,

      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: OnBoardingScreen(),
    );
  }
}

