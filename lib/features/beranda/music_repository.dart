class MusicTrack {
  final String title;
  final String url;
  final String artworkUrl;

  MusicTrack(this.title, this.url, this.artworkUrl);
}

class MusicRepository {
  final List<MusicTrack> _playlist = [
    MusicTrack(
      'Sample 1',
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      'https://via.placeholder.com/150',
    ),
    MusicTrack(
      'Sample 2',
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
      'https://via.placeholder.com/150',
    ),
  ];

  List<MusicTrack> fetchPlaylist() => List.from(_playlist);
}
