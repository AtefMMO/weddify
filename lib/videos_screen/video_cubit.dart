import 'package:bloc/bloc.dart';
import 'package:weddify/admin_screens/admin_taps/videos/add_video_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';


part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoState(videos: []));
  getVideosList()async{
   try{
     List<VideoData> videos=await FirebaseUtilsVideo.getVideoFromFireBase();
     emit(VideoState(videos: videos));
   }catch(e){
     print('Error : $e');
   }
  }
}
