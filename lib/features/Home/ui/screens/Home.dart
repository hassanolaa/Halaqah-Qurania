import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import '../../../Muslim_features/muslim_features/ui/screens/surah.dart';
import '../../../videocall/data/firebase_stream.dart';

import '../../../Muslim_features/muslim_features/data/duaa.dart';
import '../../Cubit/cubit/home_cubit.dart';
import '../../data/models.dart';
import '../../data/network.dart';
import '../widgets/homewidget.dart';
import '../widgets/liveIcon.dart';
import 'package:halaqahqurania/generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

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
List<home_widget_model> home_widget_model_list2 = [
  home_widget_model(name: S.of(context).Quran, imagepath: 'images/3.png'),
  home_widget_model(name: 'Hadith', imagepath: 'images/4.png'),
  home_widget_model(name: 'Tasbeh', imagepath: 'images/5.png'),
  home_widget_model(name: 'Duaa', imagepath: 'images/6.png'),
  home_widget_model(name: 'Azkar', imagepath: 'images/7.png'),



];
    return BlocProvider(
      create: (context) => HomeCubit()..getAdan("cairo", "egypt")..getAyah()..changeMood(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            backgroundColor: colors.backbackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  size.height(35),
                  // user name and person icon
                
                  Row(
                    children: [
                      size.width(30),
                      Text(S.of(context).hello,
                          style: textstyle.subtitle.copyWith(fontSize: 17.sp)),
                      Text(S.of(context).user+"!",
                          style: textstyle.subtitle.copyWith(
                              fontSize: 19.sp,
                              color: colors.text,
                              fontWeight: FontWeight.bold)),
                      size.width(150),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.person_circle,
                            size: 30.sp,
                            color: colors.text,
                          )),
                    ],
                  ),
                  size.height(10),
                  // prays Time
                  state is AdanLoading?
                  CircularProgressIndicator(color: colors.primary,)
                  :
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 200.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/8.png'),
                            fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                size.height(140),
                                Row(
                                  children: [
                                    size.width(20),
                                    Text(cubit.Adan["Fajr"].toString(),style: textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.primary,fontWeight: FontWeight.bold),)
                                   ,size.width(10),
                                    Text(cubit.Adan["Sunrise"].toString(),style: textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.primary,fontWeight: FontWeight.bold),),
                                      size.width(20),
                                    Text(cubit.Adan["Dhuhr"].toString(),style: textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.primary,fontWeight: FontWeight.bold),),
                                   size.width(10),
                                    Text(cubit.Adan["Asr"].toString(),style: textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.primary,fontWeight: FontWeight.bold),),
                                   size.width(10),
                                    Text(cubit.Adan["Maghrib"].toString(),style: textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.primary,fontWeight: FontWeight.bold),),
                                  size.width(15),
                                    Text(cubit.Adan["Isha"].toString(),style: textstyle.subtitle.copyWith(fontSize: 16.sp,color: colors.primary,fontWeight: FontWeight.bold),),
                                 
                                  ],
                                )
                              ],
                            ),
                  )
                  // live stream listview
                  ,
                     StreamBuilder(
              stream:firebase_stream.getstreams() ,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colors.primary,
                    ),
                  );
                } else {
                  return Container(
                    height: 95.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return LiveIcon(
                          imagepath: snapshot.data!.docs[index]['streamimage'],
                        );
                      },
                    ),
                  );
                }
              },
            )
          
                  // Muslim Icons listview
                  ,
                 Container(
                    height: 150.h,
                    
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: home_widget_model_list2.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.navigateTo(muslim_features[index]);
                          },
                          child: Home_widget(
                            name: home_widget_model_list2[index].name,
                            imagepath: home_widget_model_list2[index].imagepath,
                          ),
                        );
                      },
                    ),
                  ),
                  size.height(15),
        state is AyahLoaded ?          
       GestureDetector (
        onTap:(){
          context.navigateTo(surah(id:cubit.ayah.surahnumber,name:cubit.ayah.surahname,englishname: cubit.ayah.englishname,));
        },
           child: Container(
               height: 250.h,
               width: MediaQuery.sizeOf(context).width*0.9,
               decoration: BoxDecoration(
                 color: colors.background,
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: colors.primary, width: 2.w),
               ),
               child: Column(
                 children: [
            size.height(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('تدبر',
                    style: textstyle.maintitle.copyWith(fontSize: 22.sp)),
                size.width(10),
              
              ],
            ),
            size.height(5),
           // surah name and ayah number in row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
                Text(    '\u06DD' +
                   convertNumberToArabic(cubit.ayah.ayahnumber!.toString()).toString(),
                    style: textstyle.subtitle.copyWith(
                        fontSize: 17.sp,
                        color: colors.text,
                        fontWeight: FontWeight.bold)),
                size.width(10),
                  Text(cubit.ayah.surahname!,
                    style: textstyle.subtitle.copyWith(fontSize: 17.sp)),
              ],
            ),
           
            
            Padding(
              padding:  EdgeInsets.only(right: 10.w,left: 10.w),
              child: Text(
                cubit.ayah.ayah!,
                style: textstyle.maintitle.copyWith(
                    fontSize: fontsize(30,16),
                    color: colors.text,
                    fontWeight: FontWeight.bold),
                   textAlign: TextAlign.center,
              ),
            ),
            size.height(10),
            
                
                
                 ],
               ),
             ),
         ):SizedBox(),
          size.height(40),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
