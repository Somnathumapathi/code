import 'package:coderelay/models/song_model.dart';
import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final Song model;
  final Function onPlay;
  const SongTile({super.key, required this.model, required this.onPlay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //     "https://ik.imagekit.io/j83rchiauw/A_List_Star/Arijit_Singh_Mobile_Banner.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        model.title,
                        style: TextStyle(
                            color: Colors.red, fontSize: 32, height: 1.1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Transform(
                      transform: Matrix4.translationValues(0, -10, 0),
                      child: Text(
                        model.artist,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(0, -12, 0),
                      child: Row(
                        children: [
                          Text(
                            model.album,
                            style:
                                TextStyle(color: Colors.white60, fontSize: 14),
                          ),
                          SizedBox(width: 5),
                          Text(
                            model.year,
                            style:
                                TextStyle(color: Colors.white30, fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    onPlay();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.play_arrow),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
