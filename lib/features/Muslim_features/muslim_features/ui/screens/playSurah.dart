import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/cubit/cubit/musilm_cubit.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/quran.dart';
import 'package:just_audio/just_audio.dart';

class playSuarh extends StatefulWidget {
  playSuarh(
      {super.key,
      required this.id,
      required this.name,
      required this.englishname});
  int id;
  String name;
  String englishname;

  @override
  State<playSuarh> createState() => _playSuarhState();
}

class _playSuarhState extends State<playSuarh> {
  bool isPlaying = false;
  int volume = 50;
  bool bottomsheet = false;
  bool speedlist = false;

  String timeFormat(Duration duration) {
    return "${duration.inHours.remainder(60).toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusilmCubit()..getSurahAudio(1, widget.id)..getReciters(),
      child: BlocConsumer<MusilmCubit, MusilmState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SurahAudioLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              );
            } else {
              final cubit = BlocProvider.of<MusilmCubit>(context);
              //  cubit.player.play();
              return Scaffold(
                bottomSheet: bottomsheet == false
                    ? null
                    : speedlist == true
                        ? Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: colors.backbackground,
                            ),
                            child: Row(
                              children: [
                                size.width(30),
                                // slider for speed
                                Container(
                                  height: 200.h,
                                  child: Slider(
                                      activeColor: colors.primary,
                                      inactiveColor:
                                          colors.primary.withOpacity(0.3),
                                      min: 0.1,
                                      max: 3,
                                      value: cubit.player.speed,
                                      onChanged: (value) {
                                        cubit.player.setSpeed(value);
                                      }),
                                ),
                                size.width(30),
                                Text("x${cubit.player.speed.roundToDouble()}",
                                    style: textstyle.subtitle.copyWith(
                                      fontSize: 18.sp,
                                    )),
                              ],
                            ),
                          )
                        : Container(
                            height: 450.h,
                            decoration: BoxDecoration(
                              color: colors.backbackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                
                                children: [
                                  size.height(20),
                                 for(int i = 0; i <cubit.recitersarabic.length-1; i++) ...{
                                    GestureDetector(
                                      onTap: (){
                                        cubit.getSurahAudio(cubit.recitersarabic[i]['id'], widget.id);
                                      },
                                      child: Container(
                                    decoration: BoxDecoration(
                                      color: colors.background,
                                      border: Border.all(
                                        color: colors.primary,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        size.width(10),
                                      // english name
                                        Text(
                                          cubit.recitersarabic[i]['reciter_name'],
                                          style: textstyle.subtitle.copyWith(color:colors.text, fontSize: 16.sp)
                                             ,
                                        ),
                                        size.width(15),
                                        // arabic name
                                        Text(
                                          cubit.recitersarabic[i]['translated_name']['name'],
                                          style: textstyle.subtitle.copyWith(color:colors.text, fontSize: 14.sp),
                                        ),
                                  
                                      ],
                                    ),
                                  ),
                                 
                                    ),
                                   
                                 },
                                  size.height(10),

                                   // save
                                  GestureDetector(
                                    onTap: () {
                                     setState(() {
                                        bottomsheet=false;
                                     });
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                        color: colors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Save",
                                          style: textstyle.subtitle.copyWith(
                                            color: colors.background,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                backgroundColor: colors.backbackground,
                body: SafeArea(
                  child: Column(
                    children: [
                      // image and surah name
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/10.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            size.height(50),
                            // surah name
                            Row(
                              children: [
                                size.width(
                                    MediaQuery.of(context).size.width * 0.25),
                                Text(
                                  widget.name,
                                  style: textstyle.maintitle,
                                ),
                              ],
                            ),
                            // surah english name
                            Row(
                              children: [
                                size.width(
                                    MediaQuery.of(context).size.width * 0.35),
                                Text(
                                  widget.englishname,
                                  style: textstyle.subtitle
                                      .copyWith(color: colors.background),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      size.height(25),
                      // Slider for audio
                      Container(
                        width: 300.w,
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
                      // row include time of audio
                      Row(
                        children: [
                          size.width(50),
                          Text(
                            timeFormat(cubit.position),
                            style: textstyle.subtitle.copyWith(fontSize: 12.sp),
                          ),
                          size.width(160),
                          Text(
                            timeFormat(cubit.duration),
                            style: textstyle.subtitle.copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      size.height(15),
                      // stop and play and seek , volume
                      Row(
                        children: [
                          size.width(55),
                          // speed of audio
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bottomsheet = !bottomsheet;
                                speedlist = !speedlist;
                              });
                            },
                            icon: Icon(
                              Icons.speed,
                              size: 30,
                              color: colors.primary,
                            ),
                          ),
                          // seek back
                          IconButton(
                            onPressed: () {
                              cubit.player
                                  .seek(cubit.position - Duration(seconds: 10));
                            },
                            icon: Icon(
                              CupertinoIcons.backward_end,
                              size: 40,
                              color: colors.primary,
                            ),
                          ),
                          size.width(10),
                          // stop
                          IconButton(
                            onPressed: () {
                              if (isPlaying == false) {
                                cubit.player.play();
                                setState(() {
                                  isPlaying = true;
                                });
                              } else {
                                cubit.player.stop();
                                setState(() {
                                  isPlaying = false;
                                });
                              }
                            },
                            icon: Icon(
                              isPlaying == false
                                  ? CupertinoIcons.play_circle_fill
                                  : CupertinoIcons.stop_circle_fill,
                              size: 55,
                              color: colors.primary,
                            ),
                          ),
                          size.width(15),
                          // seek forward
                          IconButton(
                            onPressed: () {
                              cubit.player
                                  .seek(cubit.position + Duration(seconds: 10));
                            },
                            icon: Icon(
                              CupertinoIcons.forward_end,
                              size: 40,
                              color: colors.primary,
                            ),
                          ),
                          //  reciter icon
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bottomsheet = !bottomsheet;
                                speedlist = false;
                              });
                            },
                            icon: Icon(
                              Icons.spatial_audio_off_outlined,
                              size: 30,
                              color: colors.primary,
                            ),
                          ),
                          // volume
                          // Slider(
                          //     activeColor: colors.primary,
                          //     inactiveColor: colors.primary.withOpacity(0.3),
                          //     min: 0,
                          //     max: 100,
                          //     value: volume.toDouble(),
                          //     onChanged: (value) {
                          //       setState(() {
                          //         volume = value.toInt();
                          //       });
                          //       cubit.player.setVolume(volume / 100);
                          //     }),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
