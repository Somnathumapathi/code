import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class Song {
  final String title;
  final String artist;
  final String album;
  final String year;
  final String audioUrl;
  final String imageUrl;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.audioUrl,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AudioPlayer audioPlayer;
  List<Song> songs;
  int currentIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    songs = [
      Song(
        title: "Beat It",
        artist: "Michael Jackson",
        album: "Thriller",
        year: "1983",
        audioUrl: "assets/audio/beat_it.mp3",
        imageUrl: "assets/images/beat_it.jpg",
      ),
      Song(
        title: "Billie Jean",
        artist: "Michael Jackson",
        album: "Thriller",
        year: "1982",
        audioUrl: "assets/audio/billie_jean.mp3",
        imageUrl: "assets/images/billie_jean.jpg",
      ),
      Song(
        title: "Can't Help Falling in Love",
        artist: "Elvis Presley",
        album: "Blue Hawaii (Soundtrack)",
        year: "1961",
        audioUrl: "assets/audio/cant_help_falling_in_love.mp3",
        imageUrl: "assets/images/cant_help_falling_in_love.jpg",
      ),
      Song(
        title: "Jam",
        artist: "Michael Jackson",
        album: "Dangerous",
        year: "1991",
        audioUrl: "assets/audio/jam.mp3",
        imageUrl: "assets/images/jam.jpg",
      ),
      Song(
        title: "Numb",
        artist: "Linkin Park",
        album: "Meteora",
        year: "2003",
        audioUrl: "assets/audio/numb.mp3",
        imageUrl: "assets/images/numb.jpg",
      ),
      Song(
        title: "Sweet Child o' Mine",
        artist: "Guns N' Roses",
        album: "Appetite for Destruction",
        year: "1987",
        audioUrl: "assets/audio/sweet_child_o_mine.mp3",
        imageUrl: "assets/images/sweet_child_o_mine.jpg",
      ),
      Song(
        title: "Rumbling",
        artist: "Sim",
        album: "Play Dead",
        year: "2022",
        audioUrl: "assets/audio/rumbling.mp3",
        imageUrl: "assets/images/rumbling.jpg",
      ),
      Song(
        title: "Thriller",
        artist: "Michael Jackson",
        album: "Thriller",
        year: "1982",
        audioUrl: "assets/audio/thriller.mp3",
        imageUrl: "assets/images/thriller.jpg",
      ),
      Song(
        title: "Until I Found You",
        artist: "Stephen Sanchez",
        album: "Easy on My Eyes",
        year: "2021",
        audioUrl: "assets/audio/until_i_found_you.mp3",
        imageUrl: "assets/images/until_i_found_you.jpg",
      ),
      Song(
        title: "We Will Rock You",
        artist: "Queen",
        album: "News of the World",
        year: "1977",
        audioUrl: "assets/audio/we_will_rock_you.mp3",
        imageUrl: "assets/images/we_will_rock_you.jpg",
      ),
      // Add other songs similarly
    ];

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      setState(() {
        isPlaying = state == AudioPlayerState.PLAYING;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage(songs[currentIndex].imageUrl),
          ),
          SizedBox(height: 20),
          Text(
            '${songs[currentIndex].title} - ${songs[currentIndex].artist}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Album: ${songs[currentIndex].album} (${songs[currentIndex].year})',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Slider(
              onChanged: (double value) {
                // Implement seeking functionality
              },
              value: 0.0, // You should set the current position here
              max: 1.0, // Set the duration of the audio file here
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 36,
                onPressed: () {
                  // Implement previous track functionality
                },
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 64,
                onPressed: () {
                  if (isPlaying) {
                    audioPlayer.pause();
                  } else {
                    audioPlayer.play(songs[currentIndex].audioUrl);
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                iconSize: 36,
                onPressed: () {
                  // Implement next track functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
