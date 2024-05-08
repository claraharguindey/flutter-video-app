import 'package:vertical_videos_avm/data/local_video_post.dart';
import 'package:vertical_videos_avm/domain/datasources/video_post_datasource.dart';
import 'package:vertical_videos_avm/domain/entities/video_post.dart';
import 'package:vertical_videos_avm/infrastructure/models/local_video_model.dart';

class LocalVideoDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getPropesioVideosPerPagina(int pagina) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> novisVideos = videoPosts
        .map((video) =>
            LocalVideoModel.venitAbJSON(video).factiVideoPostEntity())
        .toList();

    return novisVideos;
  }
}
