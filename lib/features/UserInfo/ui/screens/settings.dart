import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/data/network.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../../Auth/ui/screens/signin.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          size.height(50),
          // user name and person icon and user email
          Row(
            children: [
              size.width(15),
              CircleAvatar(
                backgroundColor: colors.primary,
                radius: 30.r,
                child: Icon(
                  Icons.person_outline,
                  size: 30.sp,
                  color: colors.background,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text('User Name',
                          style: textstyle.subtitle
                              .copyWith(fontSize: 17.sp, color: colors.text)),
                    ],
                  ),
                  size.height(5),
                  Row(
                    children: [
                      size.width(30),
                      Text('hssjdajal@gmail.com',
                          style: textstyle.subtitle.copyWith(
                            fontSize: 14.sp,
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
          size.height(50),
          // sign out
          InkWell(
            onTap: () {
              authNetwork.signOut();
              context.navigateTo(signin());
            },
            child: Container(
              height: 50.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  'Sign Out',
                  style: textstyle.subtitle
                      .copyWith(color: colors.background, fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
