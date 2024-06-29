import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/duaa.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../widgets/muslim_grid.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
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
                  Text('Hello,',
                      style: textstyle.subtitle.copyWith(fontSize: 17.sp)),
                  Text('Hassan!',
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
              // gridview
              Container(
                height: 400.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: home_widget_model_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          context.navigateTo(muslim_features[index]);
                        },
                        child: Muslim_grid(
                          name: home_widget_model_list[index].name,
                          imagepath: home_widget_model_list[index].imagepath,
                        ));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
