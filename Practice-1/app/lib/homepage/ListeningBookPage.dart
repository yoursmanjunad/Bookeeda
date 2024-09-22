import 'package:flutter/material.dart';
class ListeningPage extends StatefulWidget {
  final String bookTitle;
  final String bookPoster;

  ListeningPage({required this.bookTitle, required this.bookPoster});

  @override
  _ListeningPageState createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  bool isPlaying = false;
  double playbackPosition = 0.0;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void forward() {
    setState(() {
      playbackPosition += 10.0; // Forward by 10 seconds
    });
  }

  void rewind() {
    setState(() {
      playbackPosition = (playbackPosition - 10.0).clamp(0.0, playbackPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookTitle),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Book Poster
          Container(
            height: MediaQuery.of(context).size.height * 0.5, // Takes up 50% of screen height
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.bookPoster),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Book Title
          Text(
            widget.bookTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Playback Controls
          Text(
            isPlaying ? "Playing" : "Paused",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Seekbar (Just a simple text representation)
          Slider(
            value: playbackPosition,
            min: 0,
            max: 300, // Assume the total length of the audiobook is 300 seconds
            divisions: 300,
            label: "${playbackPosition.toInt()} sec",
            onChanged: (value) {
              setState(() {
                playbackPosition = value;
              });
            },
          ),
          SizedBox(height: 20),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10, size: 36),
                onPressed: rewind,
                tooltip: 'Rewind 10 seconds',
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 60),
                onPressed: togglePlayPause,
                tooltip: isPlaying ? 'Pause' : 'Play',
              ),
              IconButton(
                icon: Icon(Icons.forward_10, size: 36),
                onPressed: forward,
                tooltip: 'Forward 10 seconds',
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
