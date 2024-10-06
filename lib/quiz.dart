import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenHabit',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: YouTubeVideoPlayer(),
    );
  }
}

class YouTubeVideoPlayer extends StatefulWidget {
  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  final String videoId = '7V8oFI4GYMY';
  late YoutubePlayerController _controller;

  int _bestScore = 0; // Variable to store the best score
  int _currentQuestionIndex = -1;
  int _score = 0;
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What does "sustainable development" primarily focus on?',
      'image': 'https://unsplash.com/photos/astronaut-in-spacesuit-floating-in-space-Yj1M5riCKk4', // Use an appropriate image URL
      'answers': [
        {'text': 'Economic growth only', 'score': 0},
        {'text': 'Meeting the needs of the present without', 'score': 1},

      ],
    },
    {
      'questionText': 'Which of the following is a goal of sustainable development?',
      'image': 'https://images.unsplash.com/photo-1713077434860-c62fa08d8f91?q=80&w=3156&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Use an appropriate image URL
      'answers': [
        {'text': 'End poverty in all its forms everywhere', 'score': 1},
        {'text': 'Maximize fossil fuel consumption', 'score': 0},

      ],
    },
    {
      'questionText': 'What is a key component of sustainable agriculture?',
      'image': 'https://images.unsplash.com/photo-1552288094-03a03785f2a8?q=80&w=1922&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Use an appropriate image URL
      'answers': [
        {'text': 'Use of chemical fertilizers only', 'score': 0},
        {'text': 'Crop rotation and organic practices', 'score': 1},

      ],
    },
    {
      'questionText': 'What is the purpose of the UN Sustainable Development Goals (SDGs)?',
      'image': 'https://images.unsplash.com/photo-1499336315816-097655dcfbda?q=80&w=2447&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Use an appropriate image URL
      'answers': [
        {'text': 'To promote economic inequality', 'score': 0},
        {'text': 'To end poverty, protect the planet, and ensure prosperity for all by 2030', 'score': 1},

      ],
    },
  ];


  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = -1;
      // Check if current score is greater than the best score and update if necessary
      if (_score > _bestScore) {
        _bestScore = _score;
      }
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video Player and Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 600,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2), // Stylish border
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              // YouTube Player
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      player,
                      SizedBox(height: 20),
                      Text(
                        'Enjoy the video!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 30),

              // Show the best score
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Best Score: $_bestScore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // Start Quiz Button
              if (_currentQuestionIndex == -1)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: HoverButton(
                    onPressed: _startQuiz,
                    child: Text(
                      'Start Quiz',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

              // Quiz Section
              Expanded(
                child: (_currentQuestionIndex >= 0 && _currentQuestionIndex < _questions.length)
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _questions[_currentQuestionIndex]['questionText'] as String,
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ...(_questions[_currentQuestionIndex]['answers']
                    as List<Map<String, Object>>)
                        .map(
                          (answer) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                          child: HoverButton(
                            onPressed: () => _answerQuestion(answer['score'] as int),
                            child: Text(
                              answer['text'] as String,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ],
                )
                    : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_currentQuestionIndex >= _questions.length)
                        Text(
                          'Quiz Complete!\nYour Score: $_score',
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      SizedBox(height: 16),
                      if (_currentQuestionIndex >= _questions.length)
                        HoverButton(
                          onPressed: _resetQuiz,
                          child: Text(
                            'Restart Quiz',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const HoverButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHovered ? Colors.greenAccent : Colors.green,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }
}