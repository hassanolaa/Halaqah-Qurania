import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:halaqahqurania/features/Muslim_features/muslim_features/ui/screens/listquran.dart';

import '../ui/screens/azkar.dart';
import '../ui/screens/duaa.dart';
import '../ui/screens/hadith.dart';
import '../ui/screens/tasbeh.dart';

class Duaa {
  final String category;
  final int count;
  final String description;
  final String reference;
  final String content;

  Duaa({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory Duaa.fromJson(Map<String, dynamic> json) {
    return Duaa(
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'content': content,
    };
  }
}

List<String> duaacategories = ["أدعية قرآنية", "أدعية نبوية"];

List<Duaa> duaafromQuranList = [
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [البقرة - 201].",
      content:
          "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. [البقرة - 201]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [البقرة - 250].",
      content:
          "رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَثَبِّتْ أَقْدَامَنَا وَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ. [البقرة - 250]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [البقرة - 286].",
      content:
          "رَبَّنَا لاَ تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلاَ تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِن قَبْلِنَا رَبَّنَا وَلاَ تُحَمِّلْنَا مَا لاَ طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنتَ مَوْلاَنَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ. [البقرة - 286]."),
  Duaa(
      category: "أدعية قرآنية",
      count:1,
      description: "",
      reference: ". [آل عمران - 8].",
      content:
          "رَبَّنَا لاَ تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً إِنَّكَ أَنتَ الْوَهَّابُ. [آل عمران - 8]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [آل عمران - 16].",
      content:
          "رَبَّنَا إِنَّنَا آمَنَّا فَاغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ. [آل عمران - 16]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [آل عمران - 38].",
      content:
          "رَبِّ هَبْ لِي مِن لَّدُنْكَ ذُرِّيَّةً طَيِّبَةً إِنَّكَ سَمِيعُ الدُّعَاء. [آل عمران - 38]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [آل عمران - 53].",
      content:
          "رَبَّنَا آمَنَّا بِمَا أَنزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ. [آل عمران - 53]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [آل عمران - 147].",
      content:
          "رَبَّنَا اغْفِرْ لَنَا ذُنُوبَنَا وَإِسْرَافَنَا فِي أَمْرِنَا وَثَبِّتْ أَقْدَامَنَا وانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ. [آل عمران - 147]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [آل عمران - 191-194].",
      content:
          "رَبَّنَا مَا خَلَقْتَ هَذا بَاطِلاً سُبْحَانَكَ فَقِنَا عَذَابَ النَّارِ رَبَّنَا إِنَّكَ مَن تُدْخِلِ النَّارَ فَقَدْ أَخْزَيْتَهُ وَمَا لِلظَّالِمِينَ مِنْ أَنصَارٍ رَّبَّنَا إِنَّنَا سَمِعْنَا مُنَادِيًا يُنَادِي لِلإِيمَانِ أَنْ آمِنُواْ بِرَبِّكُمْ فَآمَنَّا رَبَّنَا فَاغْفِرْ لَنَا ذُنُوبَنَا وَكَفِّرْ عَنَّا سَيِّئَاتِنَا وَتَوَفَّنَا مَعَ الأبْرَارِ رَبَّنَا وَآتِنَا مَا وَعَدتَّنَا عَلَى رُسُلِكَ وَلاَ تُخْزِنَا يَوْمَ الْقِيَامَةِ إِنَّكَ لاَ تُخْلِفُ الْمِيعَادَ. [آل عمران - 191-194]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [الأعراف - 23].",
      content:
          "رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ. [الأعراف - 23]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [الأعراف - 47].",
      content:
          "رَبَّنَا لاَ تَجْعَلْنَا مَعَ الْقَوْمِ الظَّالِمِينَ. [الأعراف - 47]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [الأعراف - 126].",
      content:
          "رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَتَوَفَّنَا مُسْلِمِينَ. [الأعراف - 126]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [التوبة - 129].",
      content:
          "حَسْبِيَ اللّهُ لا إِلَـهَ إِلاَّ هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ. [التوبة - 129]."),
  Duaa(
      category: "أدعية قرآنية",
      count: 1,
      description: "",
      reference: ". [يونس - 85-86].",
      content:
          "رَبَّنَا لاَ تَجْعَلْنَا فِتْنَةً لِّلْقَوْمِ الظَّالِمِينَ وَنَجِّنَا بِرَحْمَتِكَ مِنَ الْقَوْمِ الْكَاف"),
];
List<Duaa> duaafromanbya2List = [
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "آدم علية السلام.",
      reference: ". [الأعراف - 23].",
      content:
          "رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ. [الأعراف - 23]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "نوح علية السلام.",
      reference: ". [نوح - 28].",
      content:
          "رَّبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِمَن دَخَلَ بَيْتِيَ مُؤْمِنًا وَلِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ وَلَا تَزِدِ الظَّالِمِينَ إِلَّا تَبَارًا. [نوح - 28]. رَبِّ إِنِّي أَعُوذُ بِكَ أَنْ أَسْأَلَكَ مَا لَيْسَ لِي بِهِ عِلْمٌ وَإِلاَّ تَغْفِرْ لِي وَتَرْحَمْنِي أَكُن مِّنَ الْخَاسِرِينَ. [هود - 47]. رَبِّ أَنزِلْنِي مُنزَلاً مُّبَارَكاً وَأَنتَ خَيْرُ الْمُنزِلِينَ. [المؤمنون - 29]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "إبراهيم علية السلام.",
      reference: ". [هود - 47].",
      content:
          "رَبَّنَا تَقَبَّلْ مِنَّا إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ (127) رَبَّنَا وَاجْعَلْنَا مُسْلِمَيْنِ لَكَ وَمِنْ ذُرِّيَّتِنَا أُمَّةً مُسْلِمَةً لَكَ وَأَرِنَا مَنَاسِكَنَا وَتُبْ عَلَيْنَا إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ (128). [البقرة - 127-128]. رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ (40) رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ (41). [إبراهيم - 40-41]. رَبِّ هَبْ لِي حُكْمًا وَأَلْحِقْنِي بِالصَّالِحِينَ (83) وَاجْعَل لِّي لِسَانَ صِدْقٍ فِي الْآخِرِينَ (84) وَاجْعَلْنِي مِن وَرَثَةِ جَنَّةِ النَّعِيمِ (85). [الشعراء - 83-85]. رَّبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا وَإِلَيْكَ الْمَصِيرُ (4) رَبَّنَا لَا تَجْعَلْنَا فِتْنَةً لِّلَّذِينَ كَفَرُوا وَاغْفِرْ لَنَا رَبَّنَا إِنَّكَ أَنتَ الْعَزِيزُ الْحَكِيمُ (5). [الممتحنة - 4-5]. رَبِّ هَبْ لِي مِنَ الصَّالِحِينَ. [الصافات - 100]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "هود علية السلام.",
      reference: ". [المؤمنون - 29].",
      content:
          "إِنِّي تَوَكَّلْتُ عَلَى اللَّهِ رَبِّي وَرَبِّكُم ۚ مَّا مِن دَابَّةٍ إِلَّا هُوَ آخِذٌ بِنَاصِيَتِهَا ۚ إِنَّ رَبِّي عَلَىٰ صِرَاطٍ مُّسْتَقِيمٍ. [هود - 56]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "لوط علية السلام.",
      reference: ". [البقرة - 127-128].",
      content:
          "رَبِّ انْصُرْنِي عَلَى الْقَوْمِ الْمُفْسِدِينَ. [العنكبوت - 30]. رَبِّ نَجِّنِي وَأَهْلِي مِمَّا يَعْمَلُونَ. [الشعراء - 169]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "يوسف علية السلام.",
      reference: ". [إبراهيم - 40-41].",
      content:
          "فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ أَنتَ وَلِيِّي فِي الدُّنْيَا وَالْآخِرَةِ تَوَفَّنِي مُسْلِمًا وَأَلْحِقْنِي بِالصَّالِحِينَ. [يوسف - 101]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "شعيب علية السلام.",
      reference: ". [الشعراء - 83-85].",
      content:
          "وَسِعَ رَبُّنَا كُلَّ شَيْءٍ عِلْماً عَلَى اللّهِ تَوَكَّلْنَا رَبَّنَا افْتَحْ بَيْنَنَا وَبَيْنَ قَوْمِنَا بِالْحَقِّ وَأَنتَ خَيْرُ الْفَاتِحِينَ. [الأعراف - 89]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "موسى علية السلام.",
      reference: ". [الممتحنة - 4-5].",
      content:
          "رَبِّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي. [القصص - 16]. رَبِّ بِمَا أَنْعَمْتَ عَلَيَّ فَلَنْ أَكُونَ ظَهِيراً لِّلْمُجْرِمِينَ. [القصص - 17]. رَبِّ إِنِّي لِمَا أَنزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ. [القصص - 24]. رَبِّ اشْرَحْ لِي صَدْرِي (25) وَيَسِّرْ لِي أَمْرِي (26) وَاحْلُلْ عُقْدَةً مِّن لِّسَانِي (27) يَفْقَهُوا قَوْلِي (28). [طه - 25-28]."),
  Duaa(
      category: "أدعية الأنبياء",
      count: 1,
      description: "أيوب علية السلام.",
      reference: ". [الصافات - 100].",
      content:"أَنِّي مَسَّنِيَ الضُّرُّ وَأَنتَ أَرْحَمُ الرَّاحِمِينَ\". [الأنبياء - 83].,")
];



  List<Widget> muslim_features = [
   quranlist(),
    hadith(),
    tasbeh(),
    duaa_Screen(),
    Azkar()

  ];
