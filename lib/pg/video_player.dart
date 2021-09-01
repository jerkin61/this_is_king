import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerExample extends StatefulWidget {
  const VideoPlayerExample({key}) : super(key: key);

  @override
  _VideoPlayerExampleState createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {
  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      // **When the controllers change, call setState() to rebuild widget.**
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(4),
      children: <Widget>[
        const ListTile(title: Text('Play online video:')),
        Center(
          child: _videoController.value.isInitialized
              ? _buildVideoPlayerUI()
              : const CircularProgressIndicator(),
        ),
        const Divider(),
        const ListTile(
            title: Text('(Also possible to play media from local file or '
                'from assets, or display subtitles. '
                'Cf. the plugin documentation.)')),
      ],
    ));
  }

  Widget _buildVideoPlayerUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
        Text(
            '${_videoController.value.position} / ${_videoController.value.duration}'),
        VideoProgressIndicator(_videoController, allowScrubbing: true),
        ElevatedButton.icon(
          onPressed: () => _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play(),
          icon: Icon(_videoController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow),
          label: Text(_videoController.value.isPlaying ? 'Pause' : 'Play'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
