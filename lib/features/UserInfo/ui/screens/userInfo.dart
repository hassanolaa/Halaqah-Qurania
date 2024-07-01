import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../../Home/ui/screens/Home.dart';
import '../../cubit/cubit/user_info_cubit.dart';
import '../widgets/phonetextfield.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  double age = 0;
  bool male = true;
  bool code = false;

  Country? pagecountry;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String city = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserInfoCubit(),
        child: BlocConsumer<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
          final cubit = BlocProvider.of<UserInfoCubit>(context);
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
                  controller: nameController,
                  textfieldname: 'Name',
                  textfieldhinttext: 'Enter your name',
                  textfieldicon: null,
                  password: false,
                ),
                size.height(20),
                // phone field
                Column(
                  children: [
                    // text field title
                    Row(
                      children: [
                        size.width(30),
                        Text(
                          'Phone',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: colors.text,
                              fontFamily: 'Manrope'),
                        ),
                      ],
                    ),
                    size.height(10),
                    // phone field
                    Container(
                      width: 300.w,
                      height: 50.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child:
                            // two fields for phone and code
                            Row(
                          children: [
                            code == false
                                ? IconButton(
                                    color: colors.primary,
                                    onPressed: () {
                                      showCountryPicker(
                                        context: context,
                                        showPhoneCode:
                                            true, // optional. Shows phone code before the country name.
                                        onSelect: (Country country) {
                                          setState(() {
                                            pagecountry = country;
                                            code = true;
                                            cubit.getCities(
                                                pagecountry!.name.toString());
                                          });
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.flag, color: colors.text))
                                : GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        showPhoneCode:
                                            true, // optional. Shows phone code before the country name.
                                        onSelect: (Country country) {
                                          setState(() {
                                            pagecountry = country;
                                            cubit.getCities(
                                                pagecountry!.name.toString());
                                          });
                                        },
                                      );
                                    },
                                    child: Text(
                                      pagecountry!.flagEmoji.toString(),
                                      style: textstyle.subtitle,
                                    )),
                            size.width(10),
                            // phone field
                            code == false
                                ? size.width(3)
                                : state is GetcitiesLoaded
                                    ? Container(
                                        width: 80.w,
                                        height: 50.h,
                                        child: DropdownButton(
                                          value: city.isEmpty
                                              ? cubit.cities[0]
                                              : city,
                                          items: [
                                            for (int i = 0;
                                                i <= cubit.cities.length - 1;
                                                i++) ...{
                                              DropdownMenuItem(
                                                child: Text(cubit.cities[i]),
                                                value: '${cubit.cities[i]}',
                                              )
                                            }
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              city = value.toString();
                                            });
                                          },
                                        ))
                                    : size.width(5),

                            Container(
                              width: 150.w,
                              child: TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  fillColor: colors.sub_background,
                                  filled: true,
                                  hintText: ' phone number',
                                  hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: colors.subtext,
                                      fontFamily: 'Manrope'),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: colors.sub_background,
                                          width: 0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: colors.sub_background,
                                          width: 0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        // color: Color(0xfff3f4f6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
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
                ,
                size.height(10),
                Row(
                  children: [
                    size.width(30),
                    Text(
                      'Gender',
                      style: textstyle.subtitle.copyWith(
                          fontSize: 16.sp,
                          color: colors.text,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                size.height(10),
                Row(
                  children: [
                    size.width(30),
                    Container(
                      width: 180.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          size.width(5),
                          // male and female buttons
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                male = true;
                              });
                            },
                            child: Container(
                              width: 85.w,
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: male == true
                                    ? colors.background
                                    : colors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  // male icon and Male text
                                  size.width(10),

                                  Icon(
                                    Icons.male,
                                    size: 23.sp,
                                    color: male == true
                                        ? colors.primary
                                        : colors.background,
                                  ),
                                  size.width(5),
                                  Text(
                                    'Male',
                                    style: textstyle.subtitle.copyWith(
                                        color: male == true
                                            ? colors.primary
                                            : colors.background,
                                        fontSize: 15.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                male = false;
                              });
                            },
                            child: Container(
                              width: 85.w,
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: male == true
                                    ? colors.primary
                                    : colors.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  // female icon and Female text

                                  size.width(10),

                                  Icon(
                                    Icons.female,
                                    size: 23.sp,
                                    color: male == true
                                        ? colors.background
                                        : colors.primary,
                                  ),

                                  size.width(5),

                                  Text(
                                    'Female',
                                    style: textstyle.subtitle.copyWith(
                                        color: male == true
                                            ? colors.background
                                            : colors.primary,
                                        fontSize: 13.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )

                // save button
                ,
                size.height(50),
                GestureDetector(
                  onTap: () {
                    print('dsdad');
                    cubit.sendUserData(
                      nameController.text,
                      pagecountry!.name.toString(),
                      city,
                      phoneController.text,
                      age.round().toString(),
                      male == true ? 'Male' : 'Female',
                    );
                  },
                  child: Container(
                      width: 300.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          state is SendUserDataLoading
                              ? 'Loading...'
                              : 'Save changes',
                          style: textstyle.subtitle.copyWith(
                            color: colors.background,
                            fontSize: 20.sp,
                          ),
                        ),
                      )),
                )
              ],
            ),
          );
        }, listener: (context, state) {
          if (state is GetcitiesLoading) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: colors.background,
              content: Text(
                'Loading...',
                style: textstyle.subtitle.copyWith(color: colors.primary),
              ),
            ));
          }
          if (state is SendUserDataFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: colors.background,
              content: Text(
                state!.failed!,
                style: textstyle.subtitle.copyWith(color: colors.primary),
              ),
            ));
          }
          if (state is SendUserDataLoaded) {
            context.navigateTo(Home());
          }
        }));
  }
}
