import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid of 17 Images'),
        ),
        body: GridWithImages(),
      ),
    );
  }
}

class GridWithImages extends StatelessWidget {
  // List of 17 different image URLs
  final List<String> imageUrls = [
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-01.jpg', // Red Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-02.jpg', // Green Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-03.jpg', // Blue Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-04.jpg', // Yellow Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-05.jpg', // Magenta Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-06.jpg', // Cyan Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-07.jpg', // White Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-08.jpg', // Black Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-09.jpg', // Purple Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-10.jpg', // Gray Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-11.jpg', // Orange Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-12.jpg', // Brown Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-13.jpg', // SaddleBrown Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-14.jpg', // SeaGreen Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-15.jpg', // SteelBlue Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-16.jpg', // Crimson Image
    'https://sdgs.un.org/sites/default/files/goals/E_SDG_Icons-17.jpg', // GreenYellow Image
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: imageUrls.length, // We have 17 images
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index], // Get image URL from the list
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
