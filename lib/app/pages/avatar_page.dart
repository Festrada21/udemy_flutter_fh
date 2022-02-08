import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.fgua3-4.fna.fbcdn.net/v/t1.6435-9/129711076_224789719019105_4523049733879340262_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=nD7IVR9uhzUAX8UWiBU&_nc_ht=scontent.fgua3-4.fna&oh=00_AT8z0-4KNT7Tuwn_d8cbUeU-Jn3fr4EIK_Te3AjNEmNr3g&oe=6225F228'),
              radius: 25.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://www.elsoldeacapulco.com.mx/incoming/wpgvi0-villanos-creados-por-stan-lee.jpg/ALTERNATES/LANDSCAPE_1140/Villanos%20creados%20por%20Stan%20lee.jpg'),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
