
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
class profile extends StatefulWidget {
    const profile({super.key});
  
    @override
    State<profile> createState() => _profileState();
  }
  
  class _profileState extends State<profile> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/8.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.2,
                left: MediaQuery.of(context).size.width*0.35,
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage('images/3.png'),
                ),
              ),
            ],
          ),
           // user name
            Text(
              'User Name',
              style: textstyle.maintitle.copyWith(fontSize: 20.sp),
            ),
            //user email
            size.height(20),
            Row(
              children: [
                size.width(MediaQuery.of(context).size.width*0.2),

                // email icon
                Icon(
                  Icons.email_outlined,
                  size: 20.sp,
                  color: colors.text,
                ),
                size.width(10.w),
                Text(
                  'hssanabdl975@gmail.com',
                  style: textstyle.maintitle.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
            //user phone number
            size.height(20),
             
               Row(
              children: [
                size.width(MediaQuery.of(context).size.width*0.2),

                // phone icon
                Icon(
                  Icons.call_outlined,
                  size: 20.sp,
                  color: colors.text,
                ),
                size.width(10.w),
                Text(
                  '021113750975',
                  style: textstyle.maintitle.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
           // delete and block buttons
            size.height(40),
            Row(
              children: [
                size.width(MediaQuery.of(context).size.width*0.1),
                // delete button
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colors.primary,
                      width: 1.w,
                    
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                child:Center(child: Text("Delete",style: textstyle.maintitle.copyWith(color: colors.primary, fontSize: 18.sp),)) ,
                ),
              ),
                size.width(20.w),
                // block button
                GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                  color: colors.primary,
                    border: Border.all(
                      color: colors.primary,
                      width: 1.w,
                    
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                child:Center(child: Text("Block",style: textstyle.maintitle.copyWith(color: colors.background, fontSize: 18.sp),)) ,
                ),
              ),
              ],
            ),
          ]
          )
      );
    }
  }