import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  // List of tutorial videos (YouTube video IDs)
  final List<TutorialVideo> tutorialVideos = [
    TutorialVideo(
      title: 'Cara membuat roti lembut',
      videoId: 'sUaUvlw9qHc', // Replace with actual video ID
      thumbnail: 'assets/roti.jpg',
    ),
    TutorialVideo(
      title: 'Cara membuat kue Red Velvet',
      videoId: 'Zwy-gtOcIoE', // Replace with actual video ID
      thumbnail: 'assets/red_velvet.jpg',
    ),
    TutorialVideo(
      title: 'Cara membuat soft cookies',
      videoId: 'zXvjqO5sNMs', // Replace with actual video ID
      thumbnail: 'assets/kukis.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title
            const Text(
              'Baking Tutorials',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // List of tutorial videos
            Expanded(
              child: ListView.builder(
                itemCount: tutorialVideos.length,
                itemBuilder: (context, index) {
                  return _buildVideoItem(tutorialVideos[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each video item
  Widget _buildVideoItem(TutorialVideo video) {
    return GestureDetector(
      onTap: () {
        // Navigate to the video player
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(videoId: video.videoId),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Video thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  video.thumbnail,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),

              // Video title
              Expanded(
                child: Text(
                  video.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.play_circle, color: Colors.blueAccent, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// Video player screen using youtube_player_flutter
class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial Video'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Model class to represent each tutorial video
class TutorialVideo {
  String title;
  String videoId;
  String thumbnail;

  TutorialVideo({
    required this.title,
    required this.videoId,
    required this.thumbnail,
  });
}
