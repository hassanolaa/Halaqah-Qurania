import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/zekr.dart';
import 'package:halaqahqurania/core/theming/colors.dart';

import '../../data/duaa.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/quran.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/hadith.dart';

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
  List<dynamic> surah2 = [];

  String surahUrl = "";
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List<dynamic> recitersarabic = [];

  List<String> hadith = [];
  int hadithindex = 0;

  List<ayahModel> ayat = [];

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
  getSurah(int id, String lang) async {
    emit(SurahLoading());
    try {
      surah = await quran.getSurah(id, lang);
      emit(SurahLoaded());
    } catch (e) {
      emit(SurahFailed());
    }
  }

  // set reading mood
  setReadingMood(String mood, int id) {
    emit(MusilmLoading());
    try {
      readingmood = mood;
      if (readingmood == 'arabic') {
        getSurah(id, 'ar');
      } else if (readingmood == 'english') {
        getSurah(id, 'en');
      } else {
        getSurahBoth(id);
      }
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

  // get both languages
  getSurahBoth(int id) async {
    emit(SurahLoading());
    try {
      surah = await quran.getSurah(id, 'ar');
      surah2 = await quran.getSurah(id, 'en');

      emit(SurahLoaded());
    } catch (e) {
      emit(SurahFailed());
    }
  }

  // get surah audio
  getSurahAudio(int id, int chapter_number) async {
    emit(SurahAudioLoading());
    try {
      surahUrl = await quran.getSurahAudio(id, chapter_number);
      duration = await player.setUrl(
        surahUrl,
      ) as Duration;

      player.durationStream.listen((duration0) {
        duration = duration0 as Duration;
      });

      player.positionStream.listen((position0) {
        position = position0 as Duration;
      });

      Timer.periodic(Duration(seconds: 1), (timer) {
        initial();
      });

      emit(SurahAudioLoaded());
    } catch (e) {
      emit(SurahAudioFailed());
    }
  }

  // initial
  initial() {
    player.durationStream.listen((duration0) {
      duration = duration0 as Duration;
    });

    player.positionStream.listen((position0) {
      position = position0 as Duration;
    });
    emit(SurahLoaded());
  }

  // get reciters
  getReciters() async {
    emit(RecitersLoading());
    try {
      recitersarabic = await quran.getReciters('ar');
      emit(RecitersLoaded());
    } catch (e) {
      emit(RecitersFailed());
    }
  }

  // get ahadith
  getHadith(String amamName, int index) async {
    emit(HadithLoading());
    try {
      hadith = await hadithApi.getHadith(amamName);
      hadithindex = index;
      emit(HadithLoaded());
    } catch (e) {
      emit(HadithFailed());
    }
  }

  // get ayat
  getAyah(String word) async {
    emit(AyahLoading());
    try {
      ayat = await quran.getAyah(word);
      emit(AyahLoaded());
      print(ayat[0].ayah);
      print(ayat.length);
    } catch (e) {
      emit(AyahFailed());
    }
  }
}
