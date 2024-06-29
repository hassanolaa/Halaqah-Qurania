import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';


import '../../data/zekr.dart';

class zekr extends StatefulWidget {
  zekr({super.key, required this.zekr_obj});
  ZekrModel zekr_obj;

  @override
  State<zekr> createState() => _zekrState();
}

class _zekrState extends State<zekr> {
  late int count=widget.zekr_obj.count;




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
            widget.zekr_obj.content,
              style: textstyle.maintitle.copyWith(
                  fontSize: fontsize(widget.zekr_obj.content.length,16),
                  color: colors.text,
                  fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
            ),
          ),
          size.height(10),
          
          Padding(
            padding:EdgeInsets.only(right: 10.w,left: 10.w),
            child: Text(
              widget.zekr_obj.description,
              style: textstyle.maintitle.copyWith(
                fontSize: 15.sp,
                color: colors.subtext,
              ),
                   textAlign: TextAlign.center,
          
            ),
          ),
          size.height(10),
          GestureDetector(
            onTap: () {
             if(count>0)
               setState(() {
                 count--;
               });
             
            
            },
            child: CircleAvatar(
              radius: 27.r,
              backgroundColor:count==0? colors.subtext:colors.primary,
              child: Text(
              count.toString() ,
                style: textstyle.maintitle
                    .copyWith(fontSize: 22.sp, color: colors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




