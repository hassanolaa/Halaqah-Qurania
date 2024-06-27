import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

class Muslim_grid extends StatelessWidget {
   Muslim_grid({
    super.key,
    required this.name,
    required this.imagepath,

  });

  String? name;
  String? imagepath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          size.height(10),
          Image(
            width: 200.w,
            height: 100.h,
            image: AssetImage(
             imagepath!,
            ),
          ),
          size.height(10),
        Text(name!,
              style: textstyle.subtitle.copyWith(
                  fontSize: 20.sp,
                  color: colors.primary,
                  fontWeight: FontWeight.bold)),
          size.height(10),
        ],
      ),
    );
  }
}
