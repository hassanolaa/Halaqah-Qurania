import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:halaqahqurania/features/chat/data/firebase_chats.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());


  // get all users
 Stream<QuerySnapshot>  getallusers() {
    emit(getusersloading());
    emit(getusersloaded());
  return firebase_chats.getallusers();
  }


}
