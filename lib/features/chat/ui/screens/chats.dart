import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:halaqahqurania/features/chat/data/firebase_chats.dart';

import '../../cubit/cubit/chat_cubit.dart';
import '../widgets/activeusers.dart';
import 'chat.dart';

class chats extends StatefulWidget {
  const chats({super.key});

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<ChatCubit>(context);
          return Scaffold(
            backgroundColor: colors.backbackground,
            body: SingleChildScrollView(
              child: Column(children: [
                size.height(30.h),
                // row include chats text and add icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Text(
                        'Chats',
                        style: textstyle.maintitle.copyWith(fontSize: 28.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, top: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          WoltModalSheet.show<void>(
                            // pageIndexNotifier: pageIndexNotifier,
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                WoltModalSheetPage(
                                  backgroundColor: colors.backbackground,
                                  child: Container(
                                    height: 400.h,
                                    child: Column(
                                      children: [
                                        size.height(20),
                                        Text('Start chat with Others',
                                            style: textstyle.maintitle
                                                .copyWith(fontSize: 16.sp)),
                                        size.height(20),
                                        Container(
                                            height: 320,
                                            child: StreamBuilder(
                                              stream: cubit.getallusers(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return ListView.builder(
                                                    itemCount: snapshot
                                                        .data!.docs.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        leading: CircleAvatar(
                                                            radius: 22.sp,
                                                            backgroundImage:
                                                                NetworkImage(snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    [
                                                                    'userimage'])),
                                                        title: Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['name'],
                                                          style: textstyle
                                                              .maintitle
                                                              .copyWith(
                                                                  fontSize:
                                                                      15.sp),
                                                        ),
                                                        subtitle: Text(
                                                          '${snapshot.data!.docs[index]['age']} years , ${snapshot.data!.docs[index]['city']} -${snapshot.data!.docs[index]['country'].toString().toUpperCase()}',
                                                          style: textstyle
                                                              .subtitle
                                                              .copyWith(
                                                                  fontSize:
                                                                      13.sp),
                                                        ),
                                                        trailing:
                                                            GestureDetector(
                                                          onTap: () async{
                                                            if (await firebase_chats
                                                                    .checkchat(snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'uid']) ==
                                                                true) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                backgroundColor:
                                                                    colors
                                                                        .background,
                                                                content: Text(
                                                                  'Chat Already Exist',
                                                                  style: textstyle
                                                                      .subtitle
                                                                      .copyWith(
                                                                          color:
                                                                              colors.primary),
                                                                ),
                                                              ));
                                                            } else {
                                                              firebase_chats.createchat(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      ['uid'],
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      ['name'],
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      'userimage']);
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          backgroundColor: colors
                                                                              .background,
                                                                          content:
                                                                              Text(
                                                                            'Chat Created',
                                                                            style:
                                                                                textstyle.subtitle.copyWith(color: colors.primary),
                                                                          )));
                                                            }
                                                          },
                                                          child: Icon(Icons
                                                              .add_circle_outline_sharp),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ];
                            },
                          );
                        },
                        child: Icon(
                          Icons.add_circle_outline_sharp,
                          size: 30.sp,
                          color: colors.text,
                        ),
                      ),
                    ),
                  ],
                ),
                size.height(20.h),

                // listview for active users
                Container(
                  height: 95.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return activeUsers(
                        imagepath: "images/3.png",
                      );
                    },
                  ),
                )
                // search bar
                ,
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colors.background,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: colors.sub_background, width: 0)),
                    ),
                  ),
                ),
                size.height(10.h),
                // chats 1-1 or groups
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      //1-1
                      Column(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_sharp,
                            size: 20.sp,
                            color: colors.primary,
                          ),
                          size.height(5.h),
                          Text(
                            '1-1 Chats',
                            style: textstyle.maintitle.copyWith(
                                fontSize: 15.sp, color: colors.primary),
                          ),
                          size.height(5.h),
                          Container(
                              width: MediaQuery.sizeOf(context).width * 0.47,
                              height: 2.5.h,
                              color: colors.primary)
                        ],
                      ),
                      // groups
                      Column(
                        children: [
                          Icon(
                            Icons.groups_2_outlined,
                            size: 20.sp,
                            color: colors.text,
                          ),
                          size.height(5.h),
                          Text(
                            'Groups',
                            style:
                                textstyle.maintitle.copyWith(fontSize: 15.sp),
                          ),
                          size.height(5.h),
                          Container(
                              width: MediaQuery.sizeOf(context).width * 0.47,
                              height: 2.5.h,
                              color: colors.backbackground)
                        ],
                      ),
                    ],
                  ),
                ),
                size.height(10.h),

                // chats
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: StreamBuilder(
                    stream: firebase_chats.getuserchats(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child:
                              CircularProgressIndicator(color: colors.primary),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: GestureDetector(
                                  onTap: () {
                                    context.navigateTo(chat(
                                        chatid: snapshot.data!.docs[index]
                                            ['chatid'],
                                        userid:snapshot
                                                  .data!
                                                  .docs[index]['userid'] ==
                                              firebase_chats.getcurrentuserid()
                                          ?
                                      snapshot.data!.docs[index]
                                              ['otheruserid']
                                          : snapshot.data!.docs[index]
                                              ['userid'],
                                      username: snapshot.data!.docs[index]['userid'] ==
                                              firebase_chats.getcurrentuserid()
                                          ? snapshot.data!.docs[index]
                                              ['otherusername']
                                          : snapshot.data!.docs[index]
                                              ['username'],
                                        userimage: snapshot
                                                  .data!
                                                  .docs[index]['userid'] ==
                                              firebase_chats.getcurrentuserid()
                                          ? snapshot.data!.docs[index]
                                              ['otheruserimage']
                                          : snapshot.data!.docs[index]
                                              ['userimage']
                                    ));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: colors.primary,
                                      radius: 22.sp,
                                      backgroundImage: NetworkImage(snapshot
                                                  .data!
                                                  .docs[index]['userid'] ==
                                              firebase_chats.getcurrentuserid()
                                          ? snapshot.data!.docs[index]
                                              ['otheruserimage']
                                          : snapshot.data!.docs[index]
                                              ['userimage']),
                                    ),
                                    title: Text(
                                      snapshot.data!.docs[index]['userid'] ==
                                              firebase_chats.getcurrentuserid()
                                          ? snapshot.data!.docs[index]
                                              ['otherusername']
                                          : snapshot.data!.docs[index]
                                              ['username'],
                                      style: textstyle.maintitle
                                          .copyWith(fontSize: 15.sp),
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.docs[index]['lastmassage'],
                                      style: textstyle.subtitle
                                          .copyWith(fontSize: 13.sp),
                                    ),
                                    trailing: Text(
                                       snapshot.data!.docs[index]['lastmassagetime'],
                                      style: textstyle.maintitle.copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(right: 20.w, left: 20.w),
                                child: Divider(
                                  color: colors.text,
                                  thickness: 0.3.h,
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Text(
                              'No Chats Yet',
                              style: textstyle.subtitle
                                  .copyWith(color: colors.text),
                            ),
                          );
                        }
                      }
                    },
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
