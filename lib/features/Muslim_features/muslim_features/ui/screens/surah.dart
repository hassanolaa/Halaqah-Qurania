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
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/quran.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class surah extends StatefulWidget {
  surah({super.key, required this.id, required this.name});
  int? id;
  String? name;
  @override
  State<surah> createState() => _surahState();
}

class _surahState extends State<surah> {
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

  int sizefont = 18;
  bool showsettings=false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusilmCubit()..getSurah(widget.id!),
      child: BlocConsumer<MusilmCubit, MusilmState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<MusilmCubit>(context);
          if (state is SurahLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: colors.primary,
              ),
            );
          } else {
            return Scaffold(
              bottomSheet:showsettings==false?null:
              
              Container(
                                  height: 400.h,
                                  child: Column(
                                    children: [
                                      size.height(20),
                                      Text('Reading Mood',
                                          style: textstyle.maintitle
                                              .copyWith(fontSize: 16.sp)),
                                      size.height(20),
                                      // read mood buttons
                                      Row(
                                        children: [
                                          // 3 buttons for (arabic - english - both) )
                                          size.width(20),
                                          // arabic button
                                          GestureDetector(
                                            onTap: () {
                                              cubit.setReadingMood('arabic');
                                            },
                                            child: Container(
                                              width: 100.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: cubit.readingmood ==
                                                          'arabic'
                                                      ? colors.primary
                                                      : colors.background),
                                              child: Center(
                                                child: Text(
                                                  'Arabic',
                                                  style: textstyle.subtitle.copyWith(
                                                      color:
                                                         cubit.readingmood ==
                                                          'arabic'
                                                      ? colors.background
                                                           :
                                                          colors.text),
                                                ),
                                              ),
                                            ),
                                          ),
                                          size.width(10),
                                          // english button
                                          GestureDetector(
                                            onTap: () {
                                              cubit.setReadingMood('english');

                                            },
                                            child: Container(
                                              width: 100.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      cubit.readingmood ==
                                                          'english'
                                                        ? colors.primary
                                                        :
                                                      colors.background),
                                              child: Center(
                                                child: Text(
                                                  'English',
                                                  style: textstyle.subtitle.copyWith(
                                                      color:
                                                          cubit.readingmood ==
                                                          'english'
                                                            ? colors.background
                                                            :
                                                          colors.text),
                                                ),
                                              ),
                                            ),
                                          ),
                                          size.width(10),
                                          // both button
                                          GestureDetector(
                                            onTap: () {
                                              cubit.setReadingMood('both');
                                              
                                            },
                                            child: Container(
                                              width: 100.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      cubit.readingmood ==
                                                          'both'
                                                       ? colors.primary:
                                                      colors.background),
                                              child: Center(
                                                child: Text(
                                                  'Both',
                                                  style: textstyle.subtitle.copyWith(
                                                      color:
                                                           cubit.readingmood ==
                                                          'both'
                                                           ? colors.background
                                                             :
                                                          colors.text),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      size.height(20),
                                      // font size
                                      Text('Font Size   ${cubit.sizefont}',
                                          style: textstyle.maintitle
                                              .copyWith(fontSize: 16.sp)),
                                      size.height(10),
                                      // slider for font size
                                      Slider(
                                        min: 10,
                                        max: 100,
                                        value: cubit.sizefont.toDouble(),
                                        onChanged: (value) {
                                          cubit.setfontsize(value.toInt());
                                        },
                                        activeColor: colors.primary,
                                        inactiveColor:
                                            colors.primary.withOpacity(0.3),
                                      ),
                                      size.height(20),
                                      // font color
                                      Text('Font Color',
                                          style: textstyle.maintitle
                                              .copyWith(fontSize: 16.sp)),
                                      size.height(10),
                                      // 3 colors in circle avatar in row
                                      Row(
                                        children: [
                                          size.width(100),
                                          // 3 colors in circle avatar
                                          // red color
                                          GestureDetector(
                                            onTap: () {
                                             cubit.setcolor(colors.primary);
                                            },
                                            child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: colors.primary,
                                            ),
                                          ),
                                          size.width(10),
                                          // blue color
                                          GestureDetector(
                                            onTap: () {
                                             cubit.setcolor(colors.text);
                                            
                                            },
                                            child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: colors.text,
                                            ),
                                          ),
                                          size.width(10),
                                          // green color
                                          GestureDetector(
                                            onTap: () {
                                             cubit.setcolor(colors.liveText);
                                            },
                                            child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: colors.liveText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      size.height(20),

                                      GestureDetector(
                                        onTap: () {
                                        setState(() {
                                          showsettings=false;
                                        });
                                        },
                                        child: Container(
                                          width: 300.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: colors.primary),
                                          child: Center(
                                            child: Text('Save',
                                                style: textstyle.subtitle
                                                    .copyWith(
                                                        color:
                                                            colors.background)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) ,
                appBar: AppBar(
                  elevation: 0,
                  title: Text(
                    widget.name.toString(),
                    style: textstyle.subtitle
                        .copyWith(color: colors.text, fontSize: 24.sp),
                  ),
                  centerTitle: true,
                  backgroundColor: colors.backbackground,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: colors.text,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: colors.text,
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, AppRouter.search);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: colors.text,
                      ),
                      onPressed: () {
                       setState(() {
                          showsettings=!showsettings;
                       });
                  
                      },
                    ),
                  ],
                ),
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.2,
                          image: AssetImage('images/9.png'),
                          fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        size.height(5),
                        widget.id == 1 || widget.id == 9
                            ? size.height(1)
                            : Text(
                                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                style: textstyle.subtitle.copyWith(
                                    color: colors.text, fontSize: 30.sp),
                                textAlign: TextAlign.center,
                              ),
                        size.height(15),
                        RichText(
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            text: TextSpan(children: [
                              for (int i = 0; i < cubit.surah.length; i++) ...{
                                TextSpan(
                                  text: widget.id != 1
                                      ? cubit.surah[i]['text']
                                              .toString()
                                              .replaceAll(
                                                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                                  '') +
                                          '\u06DD' +
                                          convertNumberToArabic(cubit.surah[i]
                                                  ['numberInSurah']
                                              .toString())
                                      : cubit.surah[i]['text'].toString() +
                                          '\u06DD' +
                                          convertNumberToArabic(cubit.surah[i]
                                                  ['numberInSurah']
                                              .toString()),
                                  style: textstyle.subtitle.copyWith(
                                    fontSize: cubit.sizefont.toDouble(),
                                      color: cubit.color,
                                      fontWeight: FontWeight.bold),
                                ),
                              }
                            ])),
                      ],
                    ),
                  ),
                ));
          }
        },
      ),
    );
  }
}
