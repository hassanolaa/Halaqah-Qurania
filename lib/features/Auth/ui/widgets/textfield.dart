import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
class textfield extends StatelessWidget {
  
   textfield({
    required  this.textfieldname,
    required this.textfieldhinttext,
    required this.textfieldicon,
    required this.password,
    required this.controller,


    super.key,
  
  });
   
    String? textfieldname;
    String? textfieldhinttext;
    Icon? textfieldicon;
    bool? password;
    TextEditingController? controller;
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
          child: TextField(
          controller: controller,
            obscureText: password!,
            decoration: InputDecoration(
              suffixIcon: password! ? Icon(Icons.visibility_off,color:colors.text) : null,
              icon: textfieldicon,
              iconColor: colors.text,
              hintText: textfieldhinttext!,
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
              )
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xfff3f4f6),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ],);
  }
}