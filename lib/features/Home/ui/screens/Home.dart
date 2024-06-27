

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(45),
            // user name and person icon
            Row(
              children: [
                size.width(30),
                Text('Hello,', style:textstyle.subtitle.copyWith(fontSize: 17.sp) ),
                Text('Hassan!', style:textstyle.subtitle.copyWith(fontSize: 19.sp,color: colors.text,fontWeight: FontWeight.bold) ),
                size.width(150),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.person_circle,size: 30.sp,color: colors.text,)),


              ],
            )
            ,size.height(15),
            // prays Time
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200.h,
              decoration: BoxDecoration(
                color: colors.text,
              ),
            )
            // Muslim Icons
            ,size.height(15),
            Row(children: [
              size.width(60),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: colors.text,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  children: [
                    size.height(10),
                    Icon(Icons.book,size: 40.sp,color: colors.background,),
                    size.height(10),
                    Text('Quran',style: textstyle.subtitle.copyWith(fontSize: 17.sp,color: colors.background),)
                  ],
                ),
              ),
                size.width(25),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: colors.text,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  children: [
                    size.height(10),
                    Icon(Icons.book,size: 40.sp,color: colors.background,),
                    size.height(10),
                    Text('Quran',style: textstyle.subtitle.copyWith(fontSize: 17.sp,color: colors.background),)
                  ],
                ),
              ),
            ],)
               ,size.height(15),
            Row(children: [
              size.width(60),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: colors.text,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  children: [
                    size.height(10),
                    Icon(Icons.book,size: 40.sp,color: colors.background,),
                    size.height(10),
                    Text('Quran',style: textstyle.subtitle.copyWith(fontSize: 17.sp,color: colors.background),)
                  ],
                ),
              ),
                size.width(25),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: colors.text,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  children: [
                    size.height(10),
                    Icon(Icons.book,size: 40.sp,color: colors.background,),
                    size.height(10),
                    Text('Quran',style: textstyle.subtitle.copyWith(fontSize: 17.sp,color: colors.background),)
                  ],
                ),
              ),
            ],)
      
          ],
        ),
      ),
    );
  }
}