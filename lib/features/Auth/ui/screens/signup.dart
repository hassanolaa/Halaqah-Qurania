import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/cubit/cubit/auth_cubit.dart';
import 'package:halaqahqurania/features/Auth/ui/screens/signin.dart';
import 'package:halaqahqurania/features/Home/ui/screens/Home.dart';
import 'package:halaqahqurania/features/UserInfo/ui/screens/userInfo.dart';
import 'package:halaqahqurania/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
       if(state is SignUpLoaded){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar( backgroundColor: colors.background, content: Text(state.response,style: textstyle.subtitle.copyWith(color:colors.text,fontSize: 12.sp), )));
        if  (state.response == 'SignUp success') {
                  context.navigateTo(UserInfo());
                } 
       }

        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
            backgroundColor: colors.backbackground,

              body: Column(children: [
            size.height(20),
            // Hello text
            Row(
              children: [
                size.width(130),
                Text(S.of(context).hello, style: textstyle.maintitle),
              ],
            ),
            size.height(15),
            // Create Account text
            Text(
              S.of(context).createaac,
              style: textstyle.subtitle,
            ),
            size.height(30),
            // email textfield
            textfield(
              controller: emailController,
              textfieldname:S.of(context).email ,
              textfieldhinttext: S.of(context).entermail,
              textfieldicon: Icon(Icons.email_outlined,color:colors.text),
              password: false,
            ),
            size.height(25),
            // password textfield
            textfield(
              controller: passwordController,
              textfieldname: S.of(context).password,
              textfieldhinttext: S.of(context).enterpassword,
              textfieldicon: Icon(Icons.lock_open,color:colors.text),
              password: true,
            ),
            size.height(5),
            // forget password text
            Row(
              children: [
                size.width(30),
                Checkbox(
                  onChanged: (value) {},
                  value: false,
                  checkColor: colors.subtext,
                ),
                Text('I agree with ',
                    style: textstyle.subtitle
                        .copyWith(fontSize: 15.sp, color: colors.text)),
                Text('Terms & Conditions ',
                    style: textstyle.subtitle.copyWith(
                        fontSize: 15.sp,
                        color: colors.primary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            size.height(15),
            // sign up button
            GestureDetector(
              onTap: () {
              
                  cubit.signUp(emailController.text.trim(),
                    passwordController.text.trim()) ;
              },
              child: Container(
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.primary),
                child: Center(
                  child: Text( state is SignUpLoading? 'Loading..':'Sign Up',
                      style: textstyle.subtitle
                          .copyWith(color: colors.background)),
                ),
              ),
            ),
            size.height(20),
            // continue with google and facebook
            Row(
              children: [
                size.width(120),
                Text('Or continue with',
                    style: textstyle.subtitle.copyWith(
                        fontSize: 15.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold)),
              ],
            ),
            size.height(10),
            Row(children: [
              size.width(120),
              // google icon
              Icon(
                Bootstrap.google,
                color: colors.primary,
                size: 35,
              ),
              size.width(25),
              Container(
                color: colors.subtext,
                height: 40.h,
                width: 2.w,
              ),
              // facebook icon
              size.width(25),

              Icon(
                Icons.facebook_outlined,
                color: colors.primary,
                size: 45,
              ),
            ]),
            size.height(25),
            // don't have account text
            Row(
              children: [
                size.width(60),
                Text('Already Have An Account?',
                    style: textstyle.subtitle.copyWith(
                        fontSize: 12.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.normal,
                        color: colors.text)),
                size.width(20),
                GestureDetector(
                    onTap: () {
                      context.navigateTo(signin());
                    },
                    child: Text('Sign In Now',
                        style: textstyle.subtitle.copyWith(
                            fontSize: 13.sp,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            color: colors.primary))),
              ],
            ),
          ]));
        },
      ),
    );
  }
}
