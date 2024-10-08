import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Auth/ui/widgets/textfield.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/zekr.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import '../../cubit/cubit/musilm_cubit.dart';
import '../widgets/zekr.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  int cateindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MusilmCubit(),
        child: BlocConsumer<MusilmCubit, MusilmState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<MusilmCubit>(context);

            return Scaffold(
              backgroundColor: colors.backbackground,
              //AppBar
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: colors.text,
                  ),
                  onPressed: () {
                    context.goBack();
                  },
                ),
                title: Text(
                  'Azkar',
                  style: textstyle.maintitle.copyWith(fontSize: 25.sp),
                ),
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
                        itemCount: azkarcategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              cubit.changecategory(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10.w),
                              height: 40.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                color: cubit.cateindex == index
                                    ? colors.primary
                                    : colors.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    azkarcategories[index],
                                    style: textstyle.maintitle.copyWith(
                                        fontSize: 15.sp,
                                        color: cubit.cateindex == index
                                            ? colors.background
                                            : colors.primary),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    size.height(15),
                    // listview vertical for zekr
                    Container(
                      height: MediaQuery.of(context).size.height - 200.h,
                      child: ListView.builder(
                        addAutomaticKeepAlives: false,
                        shrinkWrap: false,
                        itemCount: cubit.test.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: zekr(
                              zekr_obj: ZekrModel(
                                  category: cubit.test[index].category,
                                  count: cubit.test[index].count,
                                  description: cubit.test[index].description,
                                  reference: cubit.test[index].reference,
                                  content: cubit.test[index].content),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, Object? state) {},
        ));
  }
}
