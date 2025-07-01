import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'music_repository.dart';

class MusicWidget extends StatefulWidget {
  const MusicWidget({super.key});

  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  late final AudioPlayer _player;
  late final List<MusicTrack> _playlist;
  int _current = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _playlist = MusicRepository().fetchPlaylist();
    _loadCurrent();
  }

  Future<void> _loadCurrent() async {
    final track = _playlist[_current];
    try {
      await _player.setUrl(track.url);
    } catch (_) {}
    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final track = _playlist[_current];
    return Card(
      child: ListTile(
        leading: Image.network(
          track.artworkUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(track.title),
        trailing: IconButton(
          icon: Icon(_player.playing ? Icons.pause : Icons.play_arrow),
          onPressed: _loading ? null : _toggle,
        ),
      ),
    );
  }
}
