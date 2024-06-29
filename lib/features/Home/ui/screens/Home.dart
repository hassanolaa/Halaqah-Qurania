import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/Home/data/models.dart';

import '../../../Muslim_features/muslim_features/data/duaa.dart';
import '../../Cubit/cubit/home_cubit.dart';
import '../../data/network.dart';
import '../widgets/homewidget.dart';
import '../widgets/liveIcon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAdan("cairo", "egypt"),
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
                  Container(
                    height: 95.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: home_widget_model_list.length,
                      itemBuilder: (context, index) {
                        return LiveIcon(
                          imagepath: home_widget_model_list[index].imagepath,
                        );
                      },
                    ),
                  )
                  // Muslim Icons listview
                  ,
                  Container(
                    height: 150.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: home_widget_model_list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.navigateTo(muslim_features[index]);
                          },
                          child: Home_widget(
                            name: home_widget_model_list[index].name,
                            imagepath: home_widget_model_list[index].imagepath,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
