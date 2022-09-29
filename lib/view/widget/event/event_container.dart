import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:techathon/model/event.dart';

class EventContainer extends StatelessWidget {

   EventContainer({super.key, required this.event});


  final Event event;

  String? formattedDate;

  List<Color> color = [
    Colors.pink,
    Colors.yellow,
    Colors.purple,
    Colors.blue,
    Colors.grey
  ];

  List<String> usr_profile_list = [
    'https://i.imgur.com/OB0y6MR.jpg',
    'https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg',
    'https://i.imgur.com/CzXTtJV.jpg',
    'https://farm4.staticflickr.com/3049/2327691528_f060ee2d1f.jpg',
    'https://i.imgur.com/OB0y6MR.jpg'
  ];

  int x = 10;

  int? plength;

  @override
  Widget build(BuildContext context) {
    String name = event.title;

    final String date =DateFormat('d,MMMM,yyyy').format(event.eventDate);

    final String location = event.location;
    final bool paid = event.cost != 0;
    final String imgUrl = event.imageUrl;
    final String teamCategory = event.domain;
    final int participantLength = event.availableSeats;

    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).disabledColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 270.h,
        width: 183.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 158.h,
                  width: 183.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(imgUrl))),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 17.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            color: const Color(0xff233C7B),
                            borderRadius: BorderRadius.circular(18.sp)),
                        child: Center(
                            child: Text(
                          "Solo & Team",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                fontSize: 10.sp,
                                fontFamily: GoogleFonts.inter().fontFamily,
                                color: Colors.white),

                        )),
                      ),
                    ),
                  ),
                ),
                paid
                    ? Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 17.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xff233C7B),
                                  borderRadius: BorderRadius.circular(18.sp)),
                              child: Center(
                                  child: Text("Paid",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            fontSize: 10.sp,
                                            fontFamily: GoogleFonts.inter().fontFamily,
                                            color: Colors.white))),

                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.transparent,
                      )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(

                          formattedDate ?? "20,May,2021",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 10.sp,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffBFBFBF)),
                        ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(

                                  fontSize: 13.sp,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontWeight: FontWeight.w600),

                        ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,

                              size:10.sp,
                            ),
                            Text(
                              location,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontSize: 10.sp,
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff233C7B)

                              ),

                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              // color: Colors.pink,
                              height: 25.h,
                              width: 78.w,
                              child: Stack(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.white,
                                  ),
                                  for (int i = 0; i <= 5; i++)
                                    Positioned(
                                      left: 12.0 * i,
                                      child: i != 5
                                          ? CircleAvatar(

                                            radius: 12.sp,

                                              backgroundImage: NetworkImage(
                                                  usr_profile_list[i]),
                                            )
                                          : CircleAvatar(

                                              radius: 12.sp,

                                              backgroundColor:
                                                  const Color(0xffC5D5FF),
                                              child: Center(
                                                child: Text(

                                                  '''${plength ?? 4}+''',

                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(

                                                          fontSize: 10.sp,

                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xff233C7B)),
                                                ),
                                              ),
                                            ),
                                    ),
                                ],
                              ),
                            ),


                            Material(
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFC5D5FF),
                                    borderRadius: BorderRadius.circular(5)),
                                width: 71.w,
                                height: 21.h,
                                alignment: Alignment.center,
                                child: Text(
                                  "Interested",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontSize: 10.sp,
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff233C7B)),
                                ),
                              ),
                            )


                            // ElevatedButton(
                            //     // style: ButtonStyle(
                            //     //   // padding: MaterialStateProperty<EdgeInsets>.,
                            //     //     elevation: MaterialStateProperty.all(10),
                            //     //     foregroundColor:
                            //     //         MaterialStateProperty.all(Colors.black),
                            //     //     minimumSize: MaterialStateProperty.all(
                            //     //         Size(71.w, 21.h)),
                            //     //     backgroundColor: MaterialStateProperty.all(
                            //     //         const Color(0xFFC5D5FF))),
                            //     onPressed: (() {}),
                            //     child: Center(
                            //       child: Text(
                            //         "Interested",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .subtitle1!
                            //             .copyWith(
                            //                 fontWeight: FontWeight.w600,
                            //                 color: const Color(0xff233C7B)),
                            //       ),
                            //     ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
