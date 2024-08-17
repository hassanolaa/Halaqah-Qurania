import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:halaqahqurania/core/local/local.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import '../../../Muslim_features/muslim_features/data/quran.dart';
import '../../data/network.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Map<String, String> Adan = {};
  ayahModel ayah = ayahModel();

  void getAdan(String city, String country) async {
    emit(AdanLoading());
    Adan = await getAdanTime(city, country);
    emit(AdanLoaded());
  }

  void getAyah() async {
    emit(AyahLoading());
    ayah = await getayah();
    emit(AyahLoaded());
  }

  void changeMood() {
    emit(lightmoodLoading());
    if (localdata.hasData("mood")) {
      if (localdata.getbool("mood") == true) {
        colors.primary = Color(0xff4dc9a4);
        colors.background = Color(0xff000000);
        colors.backbackground = Color.fromARGB(255, 23, 23, 23);
        colors.sub_background = Color(0xff7f7f7f);
        colors.text = Color(0xFFFFFFFF);
        colors.subtext = Color(0xff9095a1);
      } else {
        colors.primary = Color(0xff4dc9a4);
        colors.background = Color(0xFFFFFFFF);
        colors.backbackground = Color(0xffeaeef0);
        colors.sub_background = Color(0xfff3f4f6);
        colors.text = Color(0xff000000);
        colors.subtext = Color(0xff9095a1);
      }
    }else{
        colors.primary = Color(0xff4dc9a4);
        colors.background = Color(0xFFFFFFFF);
        colors.backbackground = Color(0xffeaeef0);
        colors.sub_background = Color(0xfff3f4f6);
        colors.text = Color(0xff000000);
        colors.subtext = Color(0xff9095a1);

    }

    emit(lightmoodLoaded());
  }
}
