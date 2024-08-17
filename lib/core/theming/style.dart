import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/local/local.dart';
import 'package:halaqahqurania/core/theming/colors.dart';



class textstyle{

 static  TextStyle maintitle = TextStyle(
    fontSize: 32.sp,
     fontWeight: FontWeight.bold,
     color: localdata.hasData("mood")==true? localdata.getbool("mood")==true?  Color(0xFFFFFFFF): Color(0xff000000):colors.text,
     fontFamily: 'Lexend'
   );
  

  static TextStyle subtitle = TextStyle(
     fontSize: 18.sp,
     fontWeight: FontWeight.normal,
     color: localdata.hasData("mood")==true? localdata.getbool("mood")==true?  Color(0xff9095a1): Color(0xff9095a1):colors.subtext,
     fontFamily: 'Lexend'
   );
  

  



}

  double fontsize(int length, int font){
    if(length>=80)
      return font.sp;
    else if(length>=50)
      return 18.sp;
    else if(length>=30)
      return 24.sp;
    else
      return 25.sp;

  }
   double subfontsize(int length){
    if(length>=80)
      return 8.sp;
    else if(length>=50)
      return 12.sp;
    else if(length>=30)
      return 18.sp;
    else
      return 15.sp;

  }