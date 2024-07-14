
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
class activeUsers extends StatelessWidget {
 activeUsers({
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
            radius: 33.r,
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
          CircleAvatar(
            radius: 8.r,
            backgroundColor: colors.primary,
           
          ),
          )
        ],
      ),
    );
  }
}
