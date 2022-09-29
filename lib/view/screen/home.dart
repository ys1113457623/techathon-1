import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:techathon/controller/event_controller.dart';
import 'package:techathon/view/screen/event.dart';
import 'package:techathon/view/screen/filters_screen.dart';

import 'package:techathon/view/widget/home/search_container.dart';
import 'package:techathon/view/widget/home/upcoming.dart';
import 'package:techathon/view/widget/event/event_container.dart';
import 'package:techathon/view/widget/home/voucher.dart';

import '../widget/home/filter_chip.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  EventController eventController = Get.put(EventController());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EventController eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 360.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/home_banner.png'),
            )),
            height: 260.h,
            child: Stack(
              children: [
                Positioned(
                    top: 125.h,
                    left: 30.w,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50.sp,
                              height: 50.sp,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/user.jpg")),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18.sp)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Harry",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Bennett University, D1-502',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                Positioned(
                    top: 205.h, left: 30.w, child: const SearchContainer())
              ],
            ),
          ),
          // FilterScreen(),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "For You",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.sp),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_today_rounded,
                          color: Color(0xFF233C7B),
                        ))
                  ],
                ),
              ),
              eventController.upcomingEvent.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CarouselSlider(
                      items: [
                          ...eventController.upcomingEvent.map((event) {
                            return GestureDetector(
                                onTap: () {
                                  Get.to(EventScreen());
                                },
                                child: EventContainer(event: event));
                          }).toList(),
                        ],
                      options: CarouselOptions(
                        height: 270.h,
                        aspectRatio: 1.448,
                        viewportFraction: 0.58,
                        // enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                      )),
            ],
          ),
        ]),
        // eventController.upcomingEvent.isEmpty
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     :
        // CarouselSlider(items: [
        //   ...eventController.upcomingEvent.map((event) {
        //     return EventContainer(event: event);
        //   }).toList(),
        // ], options: CarouselOptions(
        //   height: 270.h,
        //   aspectRatio: 1.448,
        //   viewportFraction: 0.58,
        //   // enlargeCenterPage: true,
        //   autoPlay: true,
        //   autoPlayInterval: const Duration(seconds: 3),
        //   autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //   autoPlayCurve: Curves.fastOutSlowIn,
        //   enableInfiniteScroll: true,
        //   scrollDirection: Axis.horizontal,
        // )),
      ),
    );
  }
}
