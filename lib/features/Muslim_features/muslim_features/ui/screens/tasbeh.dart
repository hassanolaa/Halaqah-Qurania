import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/tasbeh.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/zekr.dart';

class tasbeh extends StatefulWidget {
  const tasbeh({super.key});

  @override
  State<tasbeh> createState() => _tasbehState();
}

class _tasbehState extends State<tasbeh> {
  @override
  Widget build(BuildContext context) {
    int count = 5;
    return Scaffold(
      backgroundColor: colors.backbackground,
      //AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colors.text,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Tasabeh',
          style: textstyle.maintitle.copyWith(fontSize: 25.sp),
        ),
        centerTitle: true,
        backgroundColor: colors.backbackground,
        elevation: 0,
      ),
      body: Column(
        children: [
          size.height(10),
          // listview horizontal for tasbeh
          Container(
              height: 250.h,
              child: ListView.builder(
                itemCount:tasabehList.length ,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    height: 40.h,
                    width: 270.w,
                    decoration: BoxDecoration(
                      color: colors.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        size.height(60),
                        Text(
                          tasabehList[index].content,
                          style: textstyle.maintitle.copyWith(fontSize: 20.sp),
                        ),
                        size.height(80),
                        Text(
                          tasabehList[index].description,
                          style: textstyle.maintitle
                              .copyWith(fontSize: 15.sp, color: colors.subtext),
                        ),
                      ],
                    ),
                  );
                },
              )),
          size.height(40),
          // row for two buttons in containers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    count=0;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: colors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.restart_alt_outlined,
                    color: colors.primary,
                    size: 35.sp,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: colors.background,
                    size: 35.sp,
                  )),
                ),
              ),
            ],
          ),
          size.height(20),
          // circle avatar for counter
          CircleAvatar(
            radius: 50.r,
            backgroundColor: colors.primary,
            child: Center(
                child: Column(
              children: [
                size.height(20),
                Text(
                  count.toString(),
                  style: textstyle.maintitle
                      .copyWith(fontSize: 25.sp, color: colors.background),
                ),
                Text(
                  'Tasbeha',
                  style: textstyle.maintitle
                      .copyWith(fontSize: 15.sp, color: colors.background),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
