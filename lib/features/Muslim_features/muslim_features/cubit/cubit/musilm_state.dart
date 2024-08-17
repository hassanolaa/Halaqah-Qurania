part of 'musilm_cubit.dart';

@immutable
sealed class MusilmState {}

final class MusilmInitial extends MusilmState {}
final class MusilmLoading extends MusilmState {}
final class MusilmFailed extends MusilmState {}




// quran list
final class QuranListLoading extends MusilmState {}
final class QuranListLoaded extends MusilmState {}
final class QuranListFailed extends MusilmState {}

// getsurah 
final class SurahLoading extends MusilmState {}
final class SurahLoaded extends MusilmState {}
final class SurahFailed extends MusilmState {}

// get surah audio
final class SurahAudioLoading extends MusilmState {}
final class SurahAudioLoaded extends MusilmState {}
final class SurahAudioFailed extends MusilmState {}

    
// get reciters
final class RecitersLoading extends MusilmState {}
final class RecitersLoaded extends MusilmState {}
final class RecitersFailed extends MusilmState {}

// get ayat
final class AyahLoading extends MusilmState {}
final class AyahLoaded extends MusilmState {}
final class AyahFailed extends MusilmState {}


// get hadith 
final class HadithLoading extends MusilmState {}
final class HadithLoaded extends MusilmState {}
final class HadithFailed extends MusilmState {}


