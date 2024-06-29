import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/data/zekr.dart';

import '../../data/duaa.dart';

part 'musilm_state.dart';

class MusilmCubit extends Cubit<MusilmState> {
  MusilmCubit() : super(MusilmInitial());

  List<ZekrModel> test = azkarElsabah;
  int cateindex = 0;


  List<Duaa> duaatest = duaafromQuranList;
  int cateindexforduaa = 0;

  int tasbehcount = 0;

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
    }  else {
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
}
