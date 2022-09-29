import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/home/filter_chip.dart';
import 'event.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> location_items = ["Online", "In Person"];
  List<String> status_items = ["Upcoming", "Open", "Ended"];
  List<String> length_items = ["1-6 Days", "2-4 Weeks", "1 month"];
  List<String> select_tags_items = [
    "Social Good",
    "Beginner",
    "AI/ML",
    "Education",
    "Open Ended",
    "BlockChain",
    "Education",
    "Open Ended",
    "BlockChain",
    "Gaming",
    "Lifehacks",
    "Mobile"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filters",
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w800),
          ),
          filterPageDesign(
            filterlist: location_items,
            filterName: "Location",
          ),
          filterPageDesign(
            filterlist: status_items,
            filterName: "Staus",
          ),
          filterPageDesign(
            filterlist: length_items,
            filterName: "Length",
          ),
          filterPageDesign(
            filterlist: select_tags_items,
            filterName: "Select Tags",
          ),
          Center(
            child: Material(
              elevation: 5,
              child: GestureDetector(
                onTap: (() {
                  Get.to(EventScreen());
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff233C7B),
                      borderRadius: BorderRadius.circular(15)),
                  width: 173.w,
                  height: 53.h,
                  alignment: Alignment.center,
                  child: Text(
                    "APPLY",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 17.sp,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
