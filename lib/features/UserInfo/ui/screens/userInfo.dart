import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../widgets/phonetextfield.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  double age = 0;
  bool male=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          size.height(80),
          // profile info text
          Row(
            children: [
              size.width(50),
              Text(
                'Profile Information',
                style: textstyle.maintitle.copyWith(fontSize: 28.sp),
              ),
            ],
          ),
          size.height(20),
          // name field
          textfield(
            textfieldname: 'Name',
            textfieldhinttext: 'Enter your name',
            textfieldicon: null,
            password: false,
          ),
          size.height(20),
          // name field
          phonetextfield(
            textfieldname: 'Phone',
          ),
          size.height(15),
          // age proses
          // Age text
          Row(
            children: [
              size.width(30),
              Text(
                'Age',
                style: textstyle.maintitle.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          size.height(10),
          Row(
            children: [
              size.width(20),
              Container(
                width: 250.w,
                child: Slider(
                  thumbColor: colors.background,
                  value: age,
                  onChanged: (value) {
                 setState(() {
                    age = value;
                 });
                  },
                  min: 0,
                  max: 100,
                  activeColor: colors.primary,
                  inactiveColor: colors.primary.withOpacity(0.3),
                ),
              ),
              size.width(10),
              // age value
              Text(
                age.toStringAsFixed(0),
                style: textstyle.maintitle.copyWith(fontSize: 16.sp),
              ),
            ],
          )
          // gender
          ,size.height(10),
        Row(
          children: [
            size.width(30),
            Text('Gender', style:textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.text,fontWeight: FontWeight.bold),),
          ],
        ),       
          size.height(10),      
        Row(
        
          children: [
            size.width(30),
            Container(
              width: 250.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: 
              Row(children: [
                size.width(5),
                // male and female buttons
                GestureDetector(
                  onTap: (){
                    setState(() {
                      male = true;
                    });
                  },
                  child: Container(
                    width: 120.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color:  male==true? colors.background:colors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // male icon and Male text
                        size.width(10),
                
                        Icon(Icons.male,size: 23.sp,color:  male==true?colors.primary:colors.background,),
                        size.width(5),
                        Text('Male',style: textstyle.subtitle.copyWith(color: male==true?colors.primary:colors.background ,fontSize: 18.sp),)  
                      ],
                    ),
                    ),
                ),
               GestureDetector(
                onTap: (){
                  setState(() {
                      male = false;
                    });
                },
                  child:   Container(
  
                    width: 120.w,
  
                    height: 52.h,
  
                    decoration: BoxDecoration(
  
                      color:male==true? colors.primary:colors.background,
  
                      borderRadius: BorderRadius.circular(10),
  
                    ),
  
                    child: Row(
  
                      children: [
  
                        // female icon and Female text
  
                        size.width(10),
  
  
  
                        Icon(Icons.female,size: 23.sp,color: male==true? colors.background:colors.primary, ),
  
                        size.width(5),
  
                        Text('Female',style: textstyle.subtitle.copyWith(color:  male==true? colors.background:colors.primary,fontSize: 18.sp),)  
  
                      ],
  
                    ),
  
                    
  
                    ),
),

              ],),
            )
          ],
        )
        
          // save button
          ,size.height(50),      
          Container(
            width: 300.w,
            height: 55.h,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Save changes',
                style: textstyle.subtitle.copyWith(
                  color: colors.background,
                  fontSize: 20.sp,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
