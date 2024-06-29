import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../../Home/ui/screens/Home.dart';
import '../../../Muslim_features/category/ui/screens/categories.dart';
import '../../../UserInfo/ui/screens/settings.dart';

List<Widget> screens = [
 Home(),
  Container(
    child: Center(
      child: Text('Chat'),
    ),
  ),
  Container(
    child: Center(
      child: Text('Video Call'),
    ),
  ),
  categories(),
  settings(),
];

class navi extends StatefulWidget {
  const navi({super.key});

  @override
  State<navi> createState() => _naviState();
}

class _naviState extends State<navi> {
  var varscreen = screens[0];
  int selector = 0;
  void selectorfun(int index) {
    setState(() {
      selector = index;
      varscreen = screens[index];
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: varscreen,
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 5.h, left: 30, right: 2),
          height: 70.h,
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              size.width(28),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.home_outlined),
                    onPressed: () {
                   
                      setState(() {
                        varscreen = screens[0];
                        selectorfun(0);
                      });
                    },
                    color:selector==0? colors.primary:colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: selector==0? colors.primary:colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.chat_bubble_2),
                    onPressed: () {
                       setState(() {
                        varscreen = screens[1];
                        selectorfun(1);
                      });
                    },
                    color: selector==1? colors.primary:colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: selector==1? colors.primary:colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.video_call_outlined),
                    onPressed: () {
                       setState(() {
                        varscreen = screens[2];
                        selectorfun(2);
                      });
                    },
                    color: selector==2? colors.primary:colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: selector==2? colors.primary:colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu_book_rounded),
                    onPressed: () {
                       setState(() {
                        varscreen = screens[3];
                        selectorfun(3);
                      });
                    },
                    color: selector==3? colors.primary:colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: selector==3? colors.primary:colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.person_alt_circle_fill),
                    onPressed: () {
                       setState(() {
                        varscreen = screens[4];
                        selectorfun(4);
                      });
                    },
                    color: selector==4? colors.primary:colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: selector==4? colors.primary:colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
