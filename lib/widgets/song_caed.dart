import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Image.network(
                "https://ik.imagekit.io/j83rchiauw/A_List_Star/Arijit_Singh_Mobile_Banner.png"),
            SizedBox(
              height: 10,
            ),
            Text("Title"),
            Text("Artist"),
            Row(
              children: [Text("Album"), Text('Year')],
            )
          ],
        ),
      ),
    );
  }
}
