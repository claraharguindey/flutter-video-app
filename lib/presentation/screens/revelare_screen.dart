import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vertical_videos_avm/presentation/providers/revelare_provider.dart';
import 'package:vertical_videos_avm/presentation/widgets/video_scrollable_view.dart';

class RevelareScreen extends ConsumerWidget {
  const RevelareScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revelareProviderAsync = ref.watch(revelareProvider);
    return Scaffold(
        body: revelareProviderAsync.when(
            data: (videos) => VideoScrollableView(videos: videos),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
