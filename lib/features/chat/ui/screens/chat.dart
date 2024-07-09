import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/chat/data/firebase_chats.dart';
import 'package:halaqahqurania/features/chat/ui/screens/profile.dart';

import '../widgets/image_massage.dart';
import '../widgets/massages_sender.dart';
import '../widgets/text_massage.dart';

class chat extends StatefulWidget {
  chat(
      {super.key,
      required this.chatid,
      required this.userid,
      required this.username,
      required this.userimage});
  String? chatid;
  String? userid;
  String? username;
  String? userimage;

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backbackground,
      floatingActionButton: massages_sender(
        chatid: widget.chatid,
      ),
      body: Column(children: [
        size.height(30.h),
        // user name , user image , pop icon , last seen , video call icon and voice call icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.goBack();
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20.sp, color: colors.text)),
                  size.width(10.w),
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(profile());
                    },
                    child: CircleAvatar(
                      radius: 23.r,
                      backgroundImage: NetworkImage(widget.userimage!),
                      backgroundColor: colors.primary,
                    ),
                  ),
                  size.width(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.navigateTo(profile());
                        },
                        child: Text(
                          widget.username!,
                          style: textstyle.maintitle.copyWith(fontSize: 15.sp),
                        ),
                      ),
                      Text(
                        'last seen recently',
                        style: textstyle.subtitle.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 20.h),
              child: Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    size: 27.sp,
                    color: colors.primary,
                  ),
                  size.width(20.w),
                  Icon(
                    Icons.videocam_outlined,
                    size: 30.sp,
                    color: colors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
            child: Container(
                color: colors.backbackground,
                child: StreamBuilder(
                  stream: firebase_chats.getmassages(widget.chatid!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: colors.primary),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                size.height(10.h),
                                Row(
                                  mainAxisAlignment:snapshot.data!.docs[index]['senderid']==firebase_chats.getcurrentuserid()? MainAxisAlignment.end: MainAxisAlignment.end,
                                  children: [
                                    snapshot.data!.docs[index]['type']=="text"?
                                      text_massage(
                                        username: snapshot.data!.docs[index]['sendername'],
                                        time: snapshot.data!.docs[index]['time'],
                                        message: snapshot.data!.docs[index]['massage'],
                                        seen: false,
                                        isSender: snapshot.data!.docs[index]['senderid']==firebase_chats.getcurrentuserid()? true: false,
                                      ):
                                    
                                    image_massage(
                                        username: snapshot.data!.docs[index]['sendername'],
                                        time: snapshot.data!.docs[index]['time'],
                                        messageUrl: snapshot.data!.docs[index]['massage'],
                                        seen: false,
                                        isSender: snapshot.data!.docs[index]['senderid']==firebase_chats.getcurrentuserid()? true: false,
                                        isvideo: false)
                                  ],
                                ),
                              
                              ],
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    }
                  },
                ))),
      ]),
    );
  }
}
