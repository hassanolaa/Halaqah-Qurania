import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
class phonetextfield extends StatelessWidget {
  
   phonetextfield({
    required  this.textfieldname,
   

    super.key,
  
  });
   
    String? textfieldname;
 
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // text field title
      Row(
        children: [
          size.width(30),
          Text(textfieldname!,style:TextStyle(fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: colors.text,
    fontFamily: 'Manrope'),),
        ],
      ),
      size.height(10),
      // text field
      Container(
        width: 300.w,
        height: 50.h,
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: 
          // two fields for phone and code
          Row(
            children: [
             
           //   size.width(10),
              // code field
              Container(
                width: 70.w,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: colors.sub_background,
                     filled: true,
                    hintText: 'Code',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: colors.subtext,
                      fontFamily: 'Manrope'
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colors.sub_background,
                        width: 0
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colors.sub_background,
                        width: 0
                      )
                    ),
                  ),
                ),

              ),
              size.width(10),
               // phone field
              Container(
                width: 210.w,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: colors.sub_background,
                     filled: true,

                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: colors.subtext,
                      fontFamily: 'Manrope'
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colors.sub_background,
                        width: 0
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colors.sub_background,
                        width: 0
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
         
        ),
        decoration: BoxDecoration(
         // color: Color(0xfff3f4f6),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ],);
  }
}