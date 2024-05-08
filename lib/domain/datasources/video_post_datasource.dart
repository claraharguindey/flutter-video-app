import 'package:vertical_videos_avm/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>>getPropesioVideosPerPagina(int pagina);
}