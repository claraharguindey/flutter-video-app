import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vertical_videos_avm/domain/entities/video_post.dart';
import 'package:vertical_videos_avm/domain/repositories/video_post_repository.dart';
import 'package:vertical_videos_avm/infrastructure/datasources/local_video_datasource_imp.dart';
import 'package:vertical_videos_avm/infrastructure/repository/video_post_repository_impl.dart';

final videoPostRepositoryProvider = Provider<VideoPostRepository>((ref) {
  return VideoPostRepositoryImpl(videoDatasource: LocalVideoDatasource());
});


final revelareProvider = FutureProvider<List<VideoPost>>((ref) async {
  final revelareRepository = ref.watch(videoPostRepositoryProvider);
  final novisVideos = await revelareRepository.getPropesioVideosPerPagina(1);
  return novisVideos;
});
