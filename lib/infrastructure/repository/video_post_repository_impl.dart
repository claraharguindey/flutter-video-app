import 'package:vertical_videos_avm/domain/datasources/video_post_datasource.dart';
import 'package:vertical_videos_avm/domain/entities/video_post.dart';
import 'package:vertical_videos_avm/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoDatasource;

  VideoPostRepositoryImpl({required this.videoDatasource});

  @override
  Future<List<VideoPost>> getPropesioVideosPerPagina(int pagina) {
    return videoDatasource.getPropesioVideosPerPagina(pagina);
  }
}
