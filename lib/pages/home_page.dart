import 'package:carousel_slider/carousel_slider.dart';
import 'package:coderelay/models/dummy_data.dart';
import 'package:coderelay/widgets/song_caed.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sync Music'),
        backgroundColor: Color.fromARGB(255, 164, 2, 2),
      ),
      body: Column(
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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 25,
          ),
          ListView.builder(
              itemCount: songlist.length,
              itemBuilder: (context, index) {
                return MyWidget();
              })
        ],
      ),
    );
  }
}
