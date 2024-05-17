import 'package:youtube_clone/category/homeCategory.dart';

class HomeRepository {
  Future<List<DataYouTube>> getListCate() async {
    return Future.value(DataYouTube.dataYT);
  }

  List<HomeCategory> getDataYTCate() => HomeCategory.getHomeCate();
}
