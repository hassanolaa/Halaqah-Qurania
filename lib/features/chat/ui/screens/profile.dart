import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/chat/data/firebase_chats.dart';
import 'package:halaqahqurania/features/chat/ui/screens/chats.dart';

class profile extends StatefulWidget {
  profile({
    super.key,
    required this.chatid,
    required this.userid,
  });
  String chatid;
  String userid;

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Map<String, dynamic> userinfo = {};
  void getuserinfo() async {
    Map<String, dynamic> basemap = {};
    basemap = await firebase_chats.getUserinfoById(widget.userid);
    setState(() {
      userinfo = basemap;
    });
  }

  @override
  void initState() {
    super.initState();
    getuserinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userinfo.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              )
            : Column(children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/8.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.width * 0.35,
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundImage: NetworkImage(userinfo['userimage']),
                      ),
                    ),
                  ],
                ),
                // user name
                Text(
                  userinfo['username'],
                  style: textstyle.maintitle.copyWith(fontSize: 20.sp),
                ),
                size.height(5),
                Text(
                  "Last seen ${userinfo['lastseen']}  ",
                  style: textstyle.subtitle.copyWith(fontSize: 17.sp),
                ),
                size.height(20),
                Text(
                  "${userinfo['age']} years | ${userinfo['city']} - ${userinfo['country']} ",
                  style: textstyle.subtitle.copyWith(fontSize: 17.sp),
                ),
                //user email
                size.height(20),
                Row(
                  children: [
                    size.width(MediaQuery.of(context).size.width * 0.2),

                    // email icon
                    Icon(
                      Icons.email_outlined,
                      size: 20.sp,
                      color: colors.text,
                    ),
                    size.width(10.w),
                    Text(
                      '${userinfo['email']}',
                      style: textstyle.maintitle.copyWith(fontSize: 15.sp),
                    ),
                  ],
                ),
                //user phone number
                size.height(20),

                Row(
                  children: [
                    size.width(MediaQuery.of(context).size.width * 0.2),

                    // phone icon
                    Icon(
                      Icons.call_outlined,
                      size: 20.sp,
                      color: colors.text,
                    ),
                    size.width(10.w),
                    Text(
                      '${userinfo['phonenumber']}',
                      style: textstyle.maintitle.copyWith(fontSize: 15.sp),
                    ),
                  ],
                ),
                // delete and block buttons
                size.height(40),
                Row(
                  children: [
                    size.width(MediaQuery.of(context).size.width * 0.1),
                    // delete button
                    GestureDetector(
                      onTap: () {
                        firebase_chats.deletechat(widget.chatid);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: colors.background,
                            content: Text('Chat deleted',style: textstyle.subtitle.copyWith(color: colors.primary),),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        context.navigateTo(chats());
                      },
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
                        child: Center(
                            child: Text(
                          "Delete",
                          style: textstyle.maintitle
                              .copyWith(color: colors.primary, fontSize: 18.sp),
                        )),
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
                        child: Center(
                            child: Text(
                          "Block",
                          style: textstyle.maintitle.copyWith(
                              color: colors.background, fontSize: 18.sp),
                        )),
                      ),
                    ),
                  ],
                ),
              ]));
  }
}
