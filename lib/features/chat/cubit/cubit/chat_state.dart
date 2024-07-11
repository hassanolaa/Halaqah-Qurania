part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

// getallusers
final class getusersloading extends ChatState {}
final class getusersloaded extends ChatState {}
final class getusersfailed extends ChatState {}


// get audio
final class AudioLoading extends ChatState {}
final class AudioLoaded extends ChatState {}
final class AudioFailed extends ChatState {}




