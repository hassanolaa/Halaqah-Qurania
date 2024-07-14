import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:halaqahqurania/features/chat/data/firebase_chats.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String chatid = '';
  String searching = "";

  // get all users
  Stream<QuerySnapshot> getallusers() {
    emit(getusersloading());
    emit(getusersloaded());
    return firebase_chats.getallusers();
  }

  // get audio
  getAudio(String voiceUrl) async {
    emit(AudioLoading());
    try {
      duration = await player.setUrl(
        voiceUrl,
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

      emit(AudioLoaded());
    } catch (e) {
      emit(AudioFailed());
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
    emit(AudioLoaded());
  }

  // search by name
  Future<void> searchbyname(String name) async {
    emit(getusersloading());
    chatid = await firebase_chats.searchbyname(name);
    searching = name;
    emit(getusersloaded());
  }
}
