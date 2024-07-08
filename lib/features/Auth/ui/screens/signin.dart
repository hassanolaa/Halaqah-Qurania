import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/screens/signup.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../Home/ui/screens/Home.dart';
import '../../../Navi/ui/screen/navi.dart';
import '../../cubit/cubit/auth_cubit.dart';
import '../widgets/textfield.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController forgetemailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    forgetemailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is SignInLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: colors.background,
                content: Text(
                  state.response,
                  style: textstyle.subtitle
                      .copyWith(color: colors.text, fontSize: 12.sp),
                )));

            if (state.response == 'SignIn success') {
              context.navigateTo(navi());
            }
          }
          if (state is ForgetPasswordLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: colors.background,
                content: Text(
                  state.response,
                  style: textstyle.subtitle
                      .copyWith(color: colors.text, fontSize: 12.sp),
                )));
          }
        }, builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
              body: Column(children: [
            size.height(60),
            // Hello text
            Row(
              children: [
                size.width(130),
                Text('Hello.', style: textstyle.maintitle),
              ],
            ),
            size.height(15),
            // welcome back text
            Text(
              'Welcome back',
              style: textstyle.subtitle,
            ),
            size.height(30),
            // email textfield
            textfield(
              controller: emailController,
              textfieldname: 'Email',
              textfieldhinttext: 'Enter email',
              textfieldicon: Icon(Icons.email_outlined),
              password: false,
            ),
            size.height(25),
            // password textfield
            textfield(
              controller: passwordController,
              textfieldname: 'Password',
              textfieldhinttext: 'Enter Password',
              textfieldicon: Icon(Icons.lock_open),
              password: true,
            ),
            size.height(15),
            // forget password text
            Row(
              children: [
                size.width(120),
                GestureDetector(
                  onTap: () {
                    WoltModalSheet.show<void>(
                      // pageIndexNotifier: pageIndexNotifier,
                      context: context,
                      pageListBuilder: (modalSheetContext) {
                        return [
                          WoltModalSheetPage(
                            backgroundColor: colors.backbackground,
                            child: Container(
                              height: 300.h,
                              child: Column(
                                children: [
                                  size.height(20),
                                  Text('Forget Password?',
                                      style: textstyle.maintitle
                                          .copyWith(fontSize: 16.sp)),
                                  size.height(20),
                                  textfield(
                                    controller: forgetemailController,
                                    textfieldname: 'Email',
                                    textfieldhinttext: 'Enter email',
                                    textfieldicon: Icon(Icons.email_outlined),
                                    password: false,
                                  ),
                                  size.height(20),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.forgetPassword(
                                          forgetemailController.text);
                                    },
                                    child: Container(
                                      width: 300.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: colors.primary),
                                      child: Center(
                                        child: Text(
                                            state is ForgetPasswordLoading
                                                ? 'Loading..'
                                                : 'Send Email',
                                            style: textstyle.subtitle.copyWith(
                                                color: colors.background)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ];
                      },
                    );
                  },
                  child: Text('Forget Password?',
                      style: textstyle.subtitle
                          .copyWith(fontSize: 15.sp, color: colors.primary)),
                ),
              ],
            ),
            size.height(25),
            // sign in button
            GestureDetector(
              onTap: () {
                cubit.signIn(emailController.text, passwordController.text);
              },
              child: Container(
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.primary),
                child: Center(
                  child: Text(state is SignInLoading ? 'Loading..' : 'Sign In',
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
              IconButton(
                onPressed: () {
                  cubit.signInWithGoogle();
                }
               ,icon:Icon( Bootstrap.google,
                color: colors.primary,
                size: 35,
               )
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
                Text('Don\'t have an account?',
                    style: textstyle.subtitle.copyWith(
                        fontSize: 12.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.normal,
                        color: colors.text)),
                size.width(20),
                GestureDetector(
                    onTap: () {
                      context.navigateTo(SignUp());
                    },
                    child: Text('Sign up Now',
                        style: textstyle.subtitle.copyWith(
                            fontSize: 13.sp,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            color: colors.primary))),
              ],
            ),
          ]));
        }));
  }
}
