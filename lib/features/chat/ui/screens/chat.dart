import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/chat/ui/screens/profile.dart';

import '../widgets/image_massage.dart';
import '../widgets/massages_sender.dart';
import '../widgets/text_massage.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backbackground,
      floatingActionButton: massages_sender(),
      body: Column(children: [
        size.height(30.h),
        // user name , user image , pop icon , last seen , video call icon and voice call icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.goBack();
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20.sp, color: colors.text)),
                  size.width(10.w),
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(profile());
                    
                    },
                    child: CircleAvatar(
                      radius: 23.r,
                      backgroundImage: AssetImage('images/3.png'),
                      backgroundColor: colors.primary,
                    ),
                  ),
                  size.width(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.navigateTo(profile());
                        },
                        child: Text(
                          'User Name',
                          style: textstyle.maintitle.copyWith(fontSize: 15.sp),
                        ),
                      ),
                      Text(
                        'last seen recently',
                        style: textstyle.subtitle.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 20.h),
              child: Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    size: 27.sp,
                    color: colors.primary,
                  ),
                  size.width(20.w),
                  Icon(
                    Icons.videocam_outlined,
                    size: 30.sp,
                    color: colors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(child: Container(
          color: colors.backbackground,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  size.height(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     image_massage(
                      username: "Hassan Abdelkhalek",
                      time: "12:00",
                      messageUrl: "images/3.png",
                      seen: false,
                      isSender: true,
                      isvideo:false
                     )
                    ],
                  ),
                  size.height(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text_massage(
                        username: "Ali yasser",
                        time: "12:00",
                        message: "Hellohfsuidfkjdhckjdchv",
                        seen: false,
                        isSender: false,
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        )),
      
      ]),
    );
  }
}
