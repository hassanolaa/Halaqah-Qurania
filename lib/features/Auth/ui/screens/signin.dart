

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/textfield.dart';


class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        size.height(60),
        // Hello text
        Row(
          children: [
            size.width(130),
            Text('Hello.',style:textstyle.maintitle ),
          ],
        ),
        size.height(15),
        // welcome back text
        Text('Welcome back',style:textstyle.subtitle,),
        size.height(30),
        // email textfield
        textfield( textfieldname: 'Email', textfieldhinttext: 'Enter email', textfieldicon: Icon(Icons.email_outlined), password: false, ),
        size.height(25),
        // password textfield
        textfield(textfieldname: 'Password', textfieldhinttext: 'Enter Password', textfieldicon: Icon(Icons.lock_open), password:true,),
        size.height(15),
       // forget password text
        Row(
        children: [
          size.width(120),
          Text('Forget Password?',style:textstyle.subtitle.copyWith(
            fontSize: 15.sp,
            color:colors.primary)),
        ],
      ),
        size.height(25),
        // sign in button
        Container(
          width: 300.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors.primary
          ),
          child: Center(
            child: Text('Sign In',style:textstyle.subtitle.copyWith(color:colors.background)),
          ),
        ),
        size.height(20),
        // continue with google and facebook
        Row(
          children: [
            size.width(120),
            Text('Or continue with',style:textstyle.subtitle.copyWith(fontSize: 15.sp, fontFamily: 'Manrope', fontWeight:FontWeight.bold)),
          ],
        ),
        size.height(10),
        Row(
          children: [
            size.width(120),
            // google icon
            Icon(Bootstrap.google,color: colors.primary,size: 35,),
            size.width(25),
            Container(color:colors.subtext ,
            height: 40.h,
            width: 2.w,
            ),
            // facebook icon
            size.width(25),
            
            Icon(Icons.facebook_outlined,color: colors.primary,size: 45,),           
       
      ])
        ,size.height(25),
        // don't have account text
        Row(
          children: [
            size.width(60),
            Text('Don\'t have an account?',style:textstyle.subtitle.copyWith(fontSize: 12.sp, fontFamily: 'Manrope', fontWeight:FontWeight.normal,color:colors.text)),
            size.width(20),
            Text('Sign up Now',style:textstyle.subtitle.copyWith(fontSize: 13.sp, fontFamily: 'Manrope', fontWeight:FontWeight.bold,color: colors.primary)),

          ],
        ),
     

      ])
    );


  }
}

