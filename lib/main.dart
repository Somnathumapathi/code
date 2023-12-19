import 'package:coderelay/models/dummy_data.dart';
import 'package:coderelay/models/song_model.dart';
import 'package:coderelay/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),
      home: HomePage(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  final List<Song> musicList = [];

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer audioPlayer;
  late List<Song> songs;
  int currentIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    songs = songlist;

    // audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
    //   setState(() {
    //     isPlaying = state == AudioPlayerState.PLAYING;
    //   });
    // });
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
                    audioPlayer.play(songs[currentIndex].audioUrl as Source);
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
