import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../videocall/data/firebase_stream.dart';

part 'stream_state.dart';

class StreamCubit extends Cubit<StreamState> {
  StreamCubit() : super(StreamInitial());

  String image_url = "";
  String username = "";

  // upload image
  Future<void> uploadImage(bool take) async {
    emit(StreamCreateLoading());
    try {
      image_url = await firebase_stream.takeanduploadimage(false);
      emit(StreamCreateLoaded());
    } catch (e) {
      emit(StreamCreateFailed());
    }
  }

  // create stream
  Future<void> createStream(String streamname, String streamid) async {
    emit(StreamCreateLoading());
    try {
      firebase_stream.createstream(streamname, image_url, streamid);
      emit(StreamCreateLoaded());
    } catch (e) {
      emit(StreamCreateFailed());
    }
  }

  // get username
  Future<void> getusername() async {
    emit(StreamCreateLoading());
    try {
      username = await firebase_stream.getusername();
      emit(StreamCreateLoaded());
    } catch (e) {
      emit(StreamCreateFailed());
    }
  }
}
