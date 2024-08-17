import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/data/network.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../../Auth/ui/screens/signin.dart';
import '../../cubit/cubit/user_info_cubit.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit(),
      child: BlocConsumer<UserInfoCubit, UserInfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<UserInfoCubit>(context);

          return Scaffold(
            backgroundColor: colors.backbackground,
            body: Column(
              children: [
                size.height(50),
                // user name and person icon and user email
                Row(
                  children: [
                    size.width(15),
                    CircleAvatar(
                      backgroundColor: colors.primary,
                      radius: 30.r,
                      child: Icon(
                        Icons.person_outline,
                        size: 30.sp,
                        color: colors.background,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('User Name',
                                style: textstyle.subtitle.copyWith(
                                    fontSize: 17.sp, color: colors.text)),
                          ],
                        ),
                        size.height(5),
                        Row(
                          children: [
                            size.width(30),
                            Text('hssjdajal@gmail.com',
                                style: textstyle.subtitle.copyWith(
                                  fontSize: 14.sp,
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                size.height(10),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    height: 2.sp,
                    color: colors.text,
                  ),
                ),
                size.height(10),
                // edit profile
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.person_2_rounded,
                    color: colors.text,
                    size: 40,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: textstyle.subtitle.copyWith(color: colors.text),
                  ),
                ),
                size.height(5),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    height: 2.sp,
                    color: colors.text,
                  ),
                ),
                size.height(10),
                // change password

                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.security_rounded,
                    color: colors.text,
                    size: 40,
                  ),
                  title: Text(
                    "Change Password",
                    style: textstyle.subtitle.copyWith(color: colors.text),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    height: 2.sp,
                    color: colors.text,
                  ),
                ),
                size.height(10),
                // night mode
                ListTile(
                  leading: Icon(
                    Icons.nightlight_outlined,
                    color: colors.text,
                    size: 40,
                  ),
                  title: Text(
                    "Night Mood",
                    style: textstyle.subtitle.copyWith(color: colors.text),
                  ),
                  trailing: Switch(
                      activeColor: colors.primary,
                      value: cubit.lightmood,
                      onChanged: (value) {
                        cubit.lightmood = value;
                        cubit.changeMood(value);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    height: 2.sp,
                    color: colors.text,
                  ),
                ),
                size.height(10),
                // language
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    size.width(15),
                    Icon(
                      Icons.language,
                      color: colors.text,
                      size: 40,
                    ),
                    size.width(15),
                    Text(
                      "Language",
                      style: textstyle.subtitle.copyWith(color: colors.text),
                    ),
                    size.width(90),
                    Flag(
                      Flags.egypt,
                      size: 28,
                    ),
                    Switch(
                        activeColor: colors.primary,
                        value: true,
                        onChanged: (value) {}),
                    Flag(
                      Flags.united_kingdom,
                      size: 28,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    height: 2.sp,
                    color: colors.text,
                  ),
                ),
                size.height(50),

                // sign out
                InkWell(
                  onTap: () {
                    authNetwork.signOut();
                    context.navigateTo(signin());
                  },
                  child: Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Out',
                        style: textstyle.subtitle.copyWith(
                            color: colors.background, fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
