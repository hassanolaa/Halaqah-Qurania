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


