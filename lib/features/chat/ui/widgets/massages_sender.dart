import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/chat/data/firebase_chats.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class massages_sender extends StatefulWidget {
  massages_sender({super.key, required this.chatid});

  String? chatid;

  @override
  State<massages_sender> createState() => _massages_senderState();
}

class _massages_senderState extends State<massages_sender> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 40.w, right: 13.w),
        width: MediaQuery.sizeOf(context).width,
        height: 60.h,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: Row(
            children: [
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
                              height: 200.h,
                              child: Column(
                                children: [
                                  size.height(10),
                                  // take photo
                                  GestureDetector(
                                    onTap: () {
                                      firebase_chats.takeanduploadimage(widget.chatid!,true);
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.camera_alt_outlined,
                                          size: 25.sp, color: colors.text),
                                      title: Text('Take photo',
                                          style: textstyle.subtitle.copyWith(
                                              fontSize: 15.sp,
                                              color: colors.text,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  size.height(10),
                                  // upload photo
                                  GestureDetector(
                                    onTap: () {
                                      firebase_chats.takeanduploadimage(widget.chatid!,false);

                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.image,
                                          size: 25.sp, color: colors.text),
                                      title: Text('Upload image',
                                          style: textstyle.subtitle.copyWith(
                                              fontSize: 15.sp,
                                              color: colors.text,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  size.height(10),
                                  // upload video
                                  GestureDetector(
                                    onTap: () {
                                      firebase_chats.uploadvideo(widget.chatid!);
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.video_collection,
                                          size: 25.sp, color: colors.text),
                                      title: Text('Upload video',
                                          style: textstyle.subtitle.copyWith(
                                              fontSize: 15.sp,
                                              color: colors.text,
                                              fontWeight: FontWeight.bold)),
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
                  child: Icon(Icons.add_circle_outline,
                      size: 25.sp, color: colors.text)),
              size.width(7.w),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.55,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: textstyle.subtitle.copyWith(fontSize: 15.sp),
                    border: InputBorder.none,
                  ),
                ),
              ),
              size.width(7.w),
              // voice icon
              Icon(Icons.mic, size: 20.sp, color: colors.text),
              size.width(5.w),
              // send icon
              GestureDetector(
                  onTap: () {
                    // send massage
                    firebase_chats.sendmassage(
                        widget.chatid!, _controller.text, "text");
                    _controller.clear();
                  },
                  child: Icon(Icons.send, size: 20.sp, color: colors.text)),
            ],
          ),
        ));
  }
}
