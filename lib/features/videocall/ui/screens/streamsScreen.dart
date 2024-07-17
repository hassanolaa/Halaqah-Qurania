import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halaqahqurania/core/routing/router.dart';
import 'package:halaqahqurania/core/theming/size.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../videocall/data/firebase_stream.dart';

import '../../../Home/data/models.dart';
import '../../../Home/ui/widgets/liveIcon.dart';
import '../widgets/newStream.dart';
import '../widgets/streamCard.dart';

class streamScreen extends StatefulWidget {
  const streamScreen({super.key});

  @override
  State<streamScreen> createState() => _streamScreenState();
}

class _streamScreenState extends State<streamScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   firebase_stream.createstream("hjdsk", "ndjkncks", "ndkljvns");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backbackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(30.h),
            // row include streams text and add icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Text(
                    'Streams',
                    style: textstyle.maintitle.copyWith(fontSize: 28.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      WoltModalSheet.show<void>(
                        // pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            WoltModalSheetPage(
                              backgroundColor: colors.backbackground,
                              child: newStream(),
                            ),
                          ];
                        },
                      );
                    },
                    child: Icon(
                      Icons.add_circle_outline_sharp,
                      size: 30.sp,
                      color: colors.text,
                    ),
                  ),
                ),
              ],
            ),
            size.height(20.h),
            // live stream listview
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
          
            // search bar          ,
            ,
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
              child: TextField(
                onChanged: (value) {
                  //        cubit.searchbyname(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colors.background,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: colors.sub_background, width: 0)),
                ),
              ),
            ),
            size.height(10.h),
            // grid view of stream card
            StreamBuilder(
              stream:firebase_stream.getstreams(),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color:colors.primary),);
                }else{
                  return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, streamScreenRoute);
                    },
                    child: streamcard(
                      username: snapshot.data!.docs[index]['username'],
                      userimage: snapshot.data!.docs[index]['userimage'],
                      streamtitle: snapshot.data!.docs[index]['streamname'],
                      streamimage: snapshot.data!.docs[index]['streamimage'],
                      countrycity: snapshot.data!.docs[index]['userlocation'],
                      viewers: snapshot.data!.docs[index]['viewers'],
                    ),
                  );
                },
              ),
            );
         
                }
              }),
            
           ],
        ),
      ),
    );
  }
}
