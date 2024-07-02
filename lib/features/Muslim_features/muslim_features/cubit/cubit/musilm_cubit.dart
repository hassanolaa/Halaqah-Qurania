import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/zekr.dart';
import 'package:halaqahqurania/core/theming/colors.dart';

import '../../data/duaa.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/quran.dart';

part 'musilm_state.dart';

class MusilmCubit extends Cubit<MusilmState> {
  MusilmCubit() : super(MusilmInitial());

  List<ZekrModel> test = azkarElsabah;
  int cateindex = 0;

  List<Duaa> duaatest = duaafromQuranList;
  int cateindexforduaa = 0;

  int tasbehcount = 0;

  String readingmood = "";
  int sizefont = 18;
  Color color = colors.text;

  List<dynamic> quranlist = [];

  List<dynamic> surah = [];

  // for changing the category of azkar
  changecategory(int index) {
    cateindex = index;

    if (index == 0) {
      test = azkarElsabah;
    } else if (index == 1) {
      test = azkarELmasa2;
    } else if (index == 2) {
      test = azkarba3delsalah;
    } else if (index == 3) {
      test = azkarSleepList;
    } else if (index == 4) {
      test = azkarWakeupList;
    } else {
      test = azkarElsabah;
    }
    emit(MusilmInitial());
  }

  // for changing the category of duaa
  changecategoryduaa(int index) {
    cateindexforduaa = index;

    if (index == 0) {
      duaatest = duaafromQuranList;
    } else if (index == 1) {
      duaatest = duaafromanbya2List;
    } else {
      duaatest = duaafromQuranList;
    }
    emit(MusilmInitial());
  }

  incresetasbeh() {
    tasbehcount++;
    emit(MusilmInitial());
  }

  resettasbeh() {
    tasbehcount = 0;
    emit(MusilmInitial());
  }

  // get quran list
  getQuranList() async {
    emit(QuranListLoading());
    try {
      quranlist = await quran.getQuranList();
      emit(QuranListLoaded());
    } catch (e) {
      emit(QuranListFailed());
    }
  }

  // get surah
  getSurah(int id) async {
    emit(SurahLoading());
    try {
      surah = await quran.getSurah(id, "ar");
      emit(SurahLoaded());
    } catch (e) {
      emit(SurahFailed());
    }
  }

  // set reading mood
  setReadingMood(String mood) {
    emit(MusilmLoading());
    try {
      readingmood = mood;
      emit(MusilmInitial());
    } catch (e) {
      emit(MusilmFailed());
    }
  }
  // font size
  setfontsize(int size) {
    emit(MusilmLoading());
    try {
      sizefont = size;
      emit(MusilmInitial());
    } catch (e) {
      emit(MusilmFailed());
    }
  }
  // color 
  setcolor(Color color) {
    emit(MusilmLoading());
    try {
      this.color = color;
      emit(MusilmInitial());
    } catch (e) {
      emit(MusilmFailed());
    }
  }

}
