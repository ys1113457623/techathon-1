import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techathon/controller/history_controller.dart';

import '../widget/history/history_item.dart';

class AddEvent extends StatefulWidget {
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  File? pickedImage;

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 150.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pic Image From",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/history_banner2.png'),
              )),
              height: 150.h,
              child: Stack(
                children: [
                  Positioned(
                      top: 70.h,
                      left: 30.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30.sp,
                              ),
                              Text(
                                "Add Event",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.sp,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 150.w,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            // ImagePicker(registerController: registerController)
            SizedBox(
              height: 10.h,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 237.w,
                            height: 90.w,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/history_banner.png',
                            width: 237.w,
                            height: 90.w,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      onPressed: () {
                        imagePickerOption();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text("Upload the poster",
                style: GoogleFonts.raleway(
                    fontSize: 14.sp, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
