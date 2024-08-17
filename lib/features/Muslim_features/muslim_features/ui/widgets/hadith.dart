import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';

class hadithwidget extends StatefulWidget {
  hadithwidget({super.key, required this.hadithtitile});
  String hadithtitile;

  @override
  State<hadithwidget> createState() => _zekrState();
}

class _zekrState extends State<hadithwidget> {




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.primary, width: 2.w),
      ),
      child: Column(
        children: [
          size.height(10),
          
          Padding(
            padding:  EdgeInsets.only(right: 10.w,left: 10.w),
            child: Text(
            widget.hadithtitile,
              style: textstyle.maintitle.copyWith(
                  fontSize: fontsize(widget.hadithtitile.length,16),
                  color: colors.text,
                  fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
            ),
          ),
         
        ],
      ),
    );
  }
}
