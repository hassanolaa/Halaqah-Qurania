import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/cubit/cubit/musilm_cubit.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/ui/screens/playSurah.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/ui/screens/surah.dart';

class quranlist extends StatefulWidget {
  const quranlist({super.key});

  @override
  State<quranlist> createState() => _quranlistState();
}

class _quranlistState extends State<quranlist> {
  String convertNumberToArabic(String englishNumber) {
    if (englishNumber == null || englishNumber.isEmpty) {
      return '';
    }

    Map<String, String> numberMap = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    String arabicNumber = '';
    for (int i = 0; i < englishNumber.length; i++) {
      arabicNumber += numberMap[englishNumber[i]] ?? englishNumber[i];
    }

    return arabicNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MusilmCubit()..getQuranList(),
        child: BlocConsumer<MusilmCubit, MusilmState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<MusilmCubit>(context);

            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(40),
                    //container for last read
                    Row(
                      children: [
                        size.width(20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: 320.w,
                          height: 180.h,
                          decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 80, 113, 103),
                                    blurRadius: 5,
                                    offset: Offset(0, 5))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // texts
                                  Column(
                                    children: [
                                      size.height(20),
                                      // last read
                                      Row(
                                        children: [
                                          Text(
                                            '☪ Last Read',
                                            style: textstyle.maintitle.copyWith(
                                                color: colors.background,
                                                fontSize: 22.sp),
                                          ),
                                        ],
                                      ),
                                      size.height(25),
                                      // surah name
                                      Row(
                                        children: [
                                          Text(
                                            'Surah Al-Fatihah',
                                            style: textstyle.maintitle.copyWith(
                                                color: colors.text,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      size.height(30),
                                      // surah No
                                      Row(
                                        children: [
                                          Text(
                                            'Surah NO.1',
                                            style: textstyle.maintitle.copyWith(
                                                color: colors.backbackground,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  size.width(5),

                                  // quran image
                                  Image(
                                    image: AssetImage('images/3.png'),
                                    width: 130.w,
                                    height: 150.h,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        size.width(20),
                      ],
                    ),
                    size.height(20),
                    // list view.builder for the Quran list

                    state is QuranListLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: colors.primary,
                            ),
                          )
                        : Container(
                            height: MediaQuery.sizeOf(context).height - 250.h,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.quranlist.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20, bottom: 10.0),
                                    child: Container(
                                      height: 90.h,
                                      decoration: BoxDecoration(
                                          color: colors.background,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color.fromARGB(
                                                    255, 80, 113, 103),
                                                blurRadius: 5,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: Row(
                                        children: [
                                          size.width(10),
                                          // surah number
                                          Text(
                                            '\u06DD' +
                                                convertNumberToArabic(cubit
                                                        .quranlist[index]
                                                            ['number']
                                                        .toString())
                                                    .toString(),
                                            style: textstyle.subtitle.copyWith(
                                                fontSize: 32.sp,
                                                color: colors.primary),
                                          ),
                                          size.width(10),
                                          // surah name in arabic and english
                                          Column(
                                            children: [
                                              size.height(10),
                                              Text(
                                                cubit.quranlist[index]['name'],
                                                style: textstyle.subtitle
                                                    .copyWith(
                                                        fontSize: 18.sp,
                                                        color: colors.text,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              size.height(2),
                                              Text(
                                                cubit.quranlist[index]
                                                    ['englishName'],
                                                style:
                                                    textstyle.subtitle.copyWith(
                                                  fontSize: 14.sp,
                                                  color: colors.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          size.width(20),

                                          Column(
                                            children: [
                                              size.height(10),
                                              // Two buttons for play and read in row
                                              Row(
                                                children: [
                                                  // play button
                                                  GestureDetector(
                                                    onTap: (){
                                                        context
                                                          .navigateTo(playSuarh(id:cubit.quranlist[index]['number'],name:cubit.quranlist[index]['name'],englishname: cubit.quranlist[index]['englishName'],));
                                                   
                                                    },
                                                    child: Container(
                                                      width: 55.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                colors.primary),
                                                        color: colors.background,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.play_arrow,
                                                        color: colors.primary,
                                                      )),
                                                    ),
                                                  ),
                                                  size.width(10),
                                                  // read button
                                                  GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .navigateTo(surah(id:cubit.quranlist[index]['number'],name:cubit.quranlist[index]['name'],englishname: cubit.quranlist[index]['englishName'],));
                                                    },
                                                    child: Container(
                                                      width: 55.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                colors.primary),
                                                        color:
                                                            colors.background,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                        Icons
                                                            .menu_book_outlined,
                                                        color: colors.primary,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // type of the surah and its ayat count
                                              size.height(10),
                                              Row(
                                                children: [
                                                  Text(
                                                    cubit.quranlist[index]
                                                        ['revelationType'],
                                                    style: textstyle.subtitle
                                                        .copyWith(
                                                      fontSize: 14.sp,
                                                      color: colors.text,
                                                    ),
                                                  ),
                                                  size.width(10),
                                                  Text(
                                                    'Ayahs: ' +
                                                        cubit.quranlist[index][
                                                                'numberOfAyahs']
                                                            .toString(),
                                                    style: textstyle.subtitle
                                                        .copyWith(
                                                      fontSize: 13.sp,
                                                      color: colors.text,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
