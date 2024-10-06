import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaderboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Leaderboard(),
    );
  }
}

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Added SingleChildScrollView
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Header(),
              LeaderboardSection(),
              CurrentUser(),
              PointsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Leaderboard',
          style: TextStyle(fontSize: 28),
        ),
      ],
    );
  }
}

class LeaderboardSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Person(
          image:
          'https://plus.unsplash.com/premium_photo-1682096259050-361e2989706d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60',
          name: 'Arjun',
          points: '1812 points',
          position: 3,
          barHeight: 80,
        ),
        Person(
          image:
          'https://plus.unsplash.com/premium_photo-1683121771856-3c3964975777?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60',
          name: 'Ansaf',
          points: '1987 points',
          position: 2,
          barHeight: 120,
        ),
        Person(
          image:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=2788&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60',
          name: 'Nandana',
          points: '2000 points',
          position: 1,
          barHeight: 160,
        ),
      ],
    );
  }
}

class Person extends StatelessWidget {
  final String image;
  final String name;
  final String points;
  final int position;
  final double barHeight;

  Person(
      {required this.image,
        required this.name,
        required this.points,
        required this.position,
        required this.barHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 30,
        ),
        Container(
          height: barHeight,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              position.toString(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          points,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class CurrentUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60'),
            radius: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Uvais',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Points: 238',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Level: Silver',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Position: 258',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PointsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // Ensures the ListView doesn't take up infinite space
      physics: NeverScrollableScrollPhysics(), // Disables scrolling since it's inside SingleChildScrollView
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1600574691453-499962cc0611?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60'),
            radius: 20,
          ),
          title: Text(
            'Ashna',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '1087 points',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Text(
            '04',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1664533227571-cb18551cac82?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60'),
            radius: 20,
          ),
          title: Text(
            'Aslam',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '1055 points',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Text(
            '05',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60'),
            radius: 20,
          ),
           title: Text(
           'Navami',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            '1002 points',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Text(
            '06',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1689551671541-31a345ce6ae0?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D/60x60'),
            radius: 20,
          ),
          title: Text(
            'Parthiv',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '917 points',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Text(
            '07',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),



      ],
    );
  }
}