import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';

class Home_widget extends StatelessWidget {
   Home_widget({
    super.key,
    required this.name,
    required this.imagepath,

  });

  String? name;
  String? imagepath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120.w,
        height: 60.h,
        decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            size.height(10),
            Image(
              image: AssetImage(imagepath!),
              width: 150.w,
              height: 90.h,
            ),
            size.height(5),
            Text(
              name!,
              style: textstyle.subtitle.copyWith(
                  fontSize: 16.sp,
                  color: colors.primary,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
