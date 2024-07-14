 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';

import '../../cubit/cubit/chat_cubit.dart';

 class voice_massage extends StatefulWidget {
    voice_massage({super.key ,
    required this.username,
    required this.time,
    required this.message,
    required this.seen,
    required this.isSender
      });

   String? username;
   String? time;
   String? message;
    bool? seen;
    bool? isSender;

  @override
  State<voice_massage> createState() => _voice_massageState();
}

class _voice_massageState extends State<voice_massage> {
   bool isPlaying = false;
  int volume = 50;
  bool bottomsheet = false;
  bool speedlist = false;

  String timeFormat(Duration duration) {
    return "${duration.inHours.remainder(60).toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

   @override
   Widget build(BuildContext context) {
     return  BlocProvider(create: (context)=>ChatCubit()..getAudio(widget.message!),
     child:BlocConsumer<ChatCubit,ChatState>(listener: (context,state){},
     builder: (context,state){
      final cubit = BlocProvider.of<ChatCubit>(context);
      return    Container(
                        width: MediaQuery.sizeOf(context).width*0.5,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10,left:10),
                        decoration: BoxDecoration(
                          color:widget.isSender==true?colors.background :colors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft:widget.isSender==true?  Radius.circular(20):Radius.circular(0),
                            bottomRight: widget.isSender==true? Radius.circular(0):Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            size.height(2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // username
                                Text(
                                  widget.username!,
                                  style: textstyle.subtitle.copyWith(
                                    color: colors.text,
                                    fontSize:10.sp
                                  ),
                                ),
                                size.width(10.w),
                                // time
                                Text(
                                  widget.time!,
                                  style: textstyle.subtitle.copyWith(
                                    color: colors.text,
                                    fontSize:10.sp
                                  ),
                                ),
                                // seen icon
                                Icon(
                              widget.seen==true? Icons.done_all:Icons.done,
                                  size: 15.sp,
                                  color:   widget.seen==true? colors.primary: colors.text,
                                ),
                              
                              ],
                            ),
                            size.height(5.h),
                            
                            Row(
                              children: [
                                // play button
                                IconButton(
                                  onPressed: () {
                                    if (isPlaying) {
                                      cubit.player.pause();
                                      setState(() {
                                        isPlaying = false;
                                      });
                                    } else {
                                      cubit.player.play();
                                      setState(() {
                                        isPlaying = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: colors.text,
                                  ),
                                ),
                                Container(
                               width: MediaQuery.sizeOf(context).width*0.32,
                                  height:50.h,
                                  child:   Column(
                                    children: [
                                      Container(
                                       width: 150.w,
                                       child: Slider(
                                activeColor: colors.primary,
                                inactiveColor: colors.primary.withOpacity(0.3),
                                min: 0,
                                max: cubit.duration.inSeconds.toDouble(),
                                value: cubit.position.inSeconds.toDouble(),
                                onChanged: (value) {
                                      cubit.player
                                          .seek(Duration(seconds: value.toInt()));
                                      // cubit.player.setVolume(volume/100);
                                }),
                      ),
                                       Row(
                        children: [
                          size.width(5),
                          Text(
                            timeFormat(cubit.position),
                            style: textstyle.subtitle.copyWith(fontSize: 8.sp),
                          ),
                          size.width(20),
                          Text(
                            timeFormat(cubit.duration),
                            style: textstyle.subtitle.copyWith(fontSize: 8.sp),
                          ),
                        ],
                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
 
     }, 
     )
     );
     
     
     
     
     
    }
}