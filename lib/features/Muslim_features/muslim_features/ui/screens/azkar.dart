

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/zekr.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../widgets/zekr.dart';
class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backbackground,
      //AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: colors.text,),
          onPressed: () {},
        ),
        title: Text('Azkar',style: textstyle.maintitle.copyWith(fontSize: 25.sp),),
        centerTitle: true,
        backgroundColor: colors.backbackground,
        elevation: 0,
      ),
    // body
    body: SingleChildScrollView(
      child: Column(
        children: [
          size.height(15),
          // listview horizontal for Azkar
          Container(
            height: 60.h,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 10.w),
                  height: 40.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: colors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Azkar elsabah',style: textstyle.maintitle.copyWith(fontSize: 15.sp,color: colors.primary),),
                    ],
                  ),
                );
              },
            ),
          ),
          size.height(15),
         // listview vertical for zekr
          Container(
            height: MediaQuery.of(context).size.height-200.h,
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              shrinkWrap: false,
              itemCount: azkarElsabah.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: zekr(zekr_obj: ZekrModel(category: azkarElsabah[index].category, count: azkarElsabah[index].count, description: azkarElsabah[index].description, reference:azkarElsabah[index].reference, content:azkarElsabah[index].content),),
                );
              },
            ),
          ),
        ],
      ),
    ),
    
    );
  }
}
