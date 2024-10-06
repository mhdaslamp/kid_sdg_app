import 'package:flutter/material.dart';
import 'leaderboard.dart';
import 'profile.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Habit'),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return ImageGrid();
      case 1:
        return Container(
          color: Color(0xFFF06A37),
          child: Center(
            child: ProfileCard(),
          ),
        );
      case 2:
        return Leaderboard();
      default:
        return ImageGrid();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(17, (index) {
        String imageUrl = '';
        switch (index) {
          case 0:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-01.jpg';
            break;
          case 1:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-02.jpg';
            break;
          case 2:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-03.jpg';
            break;
          case 3:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-04.jpg';
            break;
          case 4:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-05.jpg';
            break;
          case 5:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-06.jpg';
            break;
          case 6:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-07.jpg';
            break;
          case 7:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-08.jpg';
            break;
          case 8:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-09.jpg';
            break;
          case 9:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-10.jpg';
            break;
          case 10:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-11.jpg';
            break;
          case 11:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-12.jpg';
            break;
          case 12:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-13.jpg';
            break;
          case 13:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-14.jpg';
            break;
          case 14:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-15.jpg';
            break;
          case 15:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-16.jpg';
            break;
          case 16:
            imageUrl =
            'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-17.jpg';
            break;
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YouTubeVideoPlayer()),
            ); // <-- Add this closing parenthesis for Navigator.push
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ); // <-- Add this closing parenthesis for GestureDetector

      }),
    );
  }
}

class TopicPage extends StatelessWidget {
  final int index;

  TopicPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SDG ${index + 1}'),
      ),
      body: Center(
        child: Text('Details about SDG ${index + 1}'),
      ),
    );
  }
}

// Placeholder for ProfilePage
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page'),
    );
  }
}
