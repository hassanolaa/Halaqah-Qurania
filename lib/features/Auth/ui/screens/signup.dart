

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/textfield.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        // Create Account text
        Text('Create Account',style:textstyle.subtitle,),
        size.height(30),
        // email textfield
        textfield( textfieldname: 'Email', textfieldhinttext: 'Enter email', textfieldicon: Icon(Icons.email_outlined), password: false, ),
        size.height(25),
        // password textfield
        textfield(textfieldname: 'Password', textfieldhinttext: 'Enter Password', textfieldicon: Icon(Icons.lock_open), password:true,),
        size.height(5),
       // forget password text
        Row(
        children: [
          size.width(30),
          Checkbox(onChanged:(value){},value: false,checkColor: colors.subtext,),
          Text('I agree with ',style:textstyle.subtitle.copyWith(
            fontSize: 15.sp,
            color: colors.text
            )),
            Text('Terms & Conditions ',style:textstyle.subtitle.copyWith(
            fontSize: 15.sp,
            color: colors.primary,
            fontWeight: FontWeight.bold
            )),
        ],
      ),
        size.height(15),
        // sign in button
        Container(
          width: 300.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors.primary
          ),
          child: Center(
            child: Text('Sign Up',style:textstyle.subtitle.copyWith(color:colors.background)),
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
            Text('Already Have An Account?',style:textstyle.subtitle.copyWith(fontSize: 12.sp, fontFamily: 'Manrope', fontWeight:FontWeight.normal,color:colors.text)),
            size.width(20),
            Text('Sign In Now',style:textstyle.subtitle.copyWith(fontSize: 13.sp, fontFamily: 'Manrope', fontWeight:FontWeight.bold,color: colors.primary)),

          ],
        ),
     

      ])
    );


  }
}