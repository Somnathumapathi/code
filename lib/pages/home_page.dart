import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coderelay/models/dummy_data.dart';
import 'package:coderelay/models/song_model.dart';
import 'package:coderelay/widgets/song_caed.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  int currentIndex = 0;
  bool isPlaying = false;
  Song? currentSong;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      print('next song');
      final i = songlist.indexOf(currentSong!);
      if (i == songlist.length - 1) return;
      currentSong = songlist[i + 1];
      setState(() {});
      audioPlayer.play(AssetSource(currentSong!.audioUrl));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sync Music'),
        backgroundColor: Color.fromARGB(255, 164, 2, 2),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    items: [
                      // Add your carousel items here
                      Image.network(
                          'https://i.ytimg.com/vi/PqE3WZKREkA/maxresdefault.jpg',
                          fit: BoxFit.cover),
                      Image.network(
                          'https://i.ytimg.com/vi/x53onxpQkWw/maxresdefault.jpg',
                          fit: BoxFit.cover),
                      Image.network(
                          'https://ik.imagekit.io/j83rchiauw/A_List_Star/Arijit_Singh_Mobile_Banner.png',
                          fit: BoxFit.cover),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your Songs",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ...songlist
                      .map((x) => SongTile(
                            model: x,
                            onPlay: () {
                              currentSong = x;
                              audioPlayer.play(AssetSource(x.audioUrl));
                              setState(() {});
                            },
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
          if (currentSong != null)
            Container(
              height: 80,
              color: Colors.redAccent,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Slider(
                          onChanged: (double value) async {
                            // Implement seeking functionality
                            final dur = await audioPlayer.getDuration();
                            final pc = value * dur!.inSeconds;
                            audioPlayer.seek(Duration(seconds: pc.toInt()));
                          },
                          value:
                              0.0, // You should set the current position here
                          max: 1.0, // Set the duration of the audio file here
                        ),
                      ),
                      IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        iconSize: 64,
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.pause();
                          } else {
                            audioPlayer
                                .play(AssetSource(currentSong!.audioUrl));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
