
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';
import 'package:icons_plus/icons_plus.dart';
class LiveIcon extends StatelessWidget {
 LiveIcon({
    super.key,
    required this.imagepath,
  });

  String? imagepath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: colors.background,
            radius: 35.r,
            backgroundImage:
                NetworkImage(imagepath!),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: 
            // CircleAvatar(
            //   radius: 6.r,
            //   backgroundColor: Colors.red,
             
            // ),
            Container(
              height: 20.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: colors.liveText,
                borderRadius: BorderRadius.circular(5.r)
              ),
              child: Center(
                child: Text('Live',style: textstyle.subtitle.copyWith(color: colors.background,fontSize: 10.sp),),
              )
            ),
          )
        ],
      ),
    );
  }
}
