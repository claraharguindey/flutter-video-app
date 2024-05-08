import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vertical_videos_avm/domain/entities/video_post.dart';
import 'package:vertical_videos_avm/config/helpers/intelligibilis_forma.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PropiumIconButton(
            valorem: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        const SizedBox(
          height: 20,
        ),
        _PropiumIconButton(
          valorem: video.views,
          iconData: Icons.remove_red_eye,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: const _PropiumIconButton(
                valorem: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _PropiumIconButton extends StatelessWidget {
  final int valorem;
  final IconData iconData;
  final Color? color;

  const _PropiumIconButton(
      {required this.valorem, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        if (valorem > 0)
          Text(IntelligibilisForma.novaFormaNumeri(valorem.toDouble()))
      ],
    );
  }
}
