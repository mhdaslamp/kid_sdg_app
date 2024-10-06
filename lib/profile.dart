import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF06A37),
        body: Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _buildProfileImage(),
          SizedBox(height: 20),
          _buildProfileName(),
          SizedBox(height: 5),
          _buildProfileJob(),
          SizedBox(height: 15),
          _buildProfileStats(),
          SizedBox(height: 20),
          SizedBox(height: 20),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 60,
      backgroundImage:
      AssetImage('assets/naruto.png'), // Replace with your image path
    );
  }

  Widget _buildProfileName() {
    return Text(
      'Albert',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProfileJob() {
    return Text(
      'Beginner',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildStatColumn('RANK', '102'),
        _buildStatColumn('Points', '124'),
      ],
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  //Widget _buildProfileButtons() {

  //}

  Widget _buildButton(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'BADGES',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              'https://i.postimg.cc/q7X1zFD8/Frame-5.png',
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://i.postimg.cc/ydLnTZHx/Frame-4.png',
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://i.postimg.cc/2SjF8xLt/Frame-3-2.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Color(0xFFF06A37),
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}
