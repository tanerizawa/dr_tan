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
      'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?fit=crop&w=150&q=80',
    ),
    MusicTrack(
      'Sample 2',
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/150px-React-icon.svg.png',
    ),
  ];

  List<MusicTrack> fetchPlaylist() => List.from(_playlist);
}
