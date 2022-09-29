import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:techathon/view/screen/addEvent.dart';
import 'package:techathon/view/screen/event.dart';

import 'package:techathon/view/screen/history.dart';

import 'package:techathon/view/screen/home.dart';
import 'package:techathon/view/widget/home/upcoming.dart';
import 'package:techathon/view/widget/home/voucher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, a) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomeScreen());
        });
  }
}
