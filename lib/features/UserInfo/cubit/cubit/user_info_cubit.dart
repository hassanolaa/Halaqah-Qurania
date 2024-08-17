import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:halaqahqurania/core/local/local.dart';
import 'package:halaqahqurania/core/theming/colors.dart';
import 'package:halaqahqurania/core/theming/style.dart';
import 'package:halaqahqurania/features/UserInfo/data/network.dart';
import 'package:meta/meta.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());

  List cities = [];

  bool lightmood = false;
  // get cities

  void getCities(String country) async {
    emit(GetcitiesLoading());
    try {
      cities = await UserNetwork.getcities(country);
      emit(GetcitiesLoaded());
    } catch (e) {
      emit(GetcitiesFailed());
    }
  }
  // add user data to firebase

  void sendUserData(String name, String country, String city,
      String phonenumber, String age, String gender) {
    print("jsklda");
    if (name.isEmpty ||
        country.isEmpty ||
        city.isEmpty ||
        phonenumber.isEmpty ||
        age.isEmpty ||
        gender.isEmpty) {
      emit(SendUserDataFailed(failed: "Please fill all the fields"));
    } else {
      emit(SendUserDataLoading());
      try {
        UserNetwork.sendUserData(name, country, city, phonenumber, age, gender);
        emit(SendUserDataLoaded());
      } catch (e) {
        emit(SendUserDataFailed(failed: e.toString()));
      }
    }
  }

  void changeMood(bool mood) {
    emit(lightmoodLoading());
    if (mood == true) {
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
    lightmood = mood;
    localdata.setbool("mood", mood);
    emit(lightmoodLoaded());
  }
}
