import 'package:vertical_videos_avm/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String video;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.video,
    required this.likes,
    required this.views,
  });

  factory LocalVideoModel.venitAbJSON(Map<String, dynamic> json) =>
      LocalVideoModel(
          name: json["name"] ?? 'No name',
          video: json["video"],
          likes: json["likes"] ?? 0,
          views: json["views"] ?? 0);

  VideoPost factiVideoPostEntity() =>
      VideoPost(descriptio: name, videoUrl: video, likes: likes, views: views);
}
