import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String descriptio;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.descriptio});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          }

          return GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(children: [
                VideoPlayer(controller),
                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoDescription(
                      descriptio: widget.descriptio,
                    ))
              ]),
            ),
          );
        });
  }
}

class _VideoDescription extends StatelessWidget {
  final String descriptio;
  const _VideoDescription({required this.descriptio});

  @override
  Widget build(BuildContext context) {
    final magnitudine = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: magnitudine.width * 0.6,
      child: Text(
        descriptio,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
