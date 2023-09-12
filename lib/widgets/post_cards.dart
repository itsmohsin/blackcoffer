import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostCards extends StatefulWidget {
  final snap;
  const PostCards({super.key, required this.snap});

  @override
  State<PostCards> createState() => _PostCardsState();
}

class _PostCardsState extends State<PostCards> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController? videoController;
    setState(() {
      videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.snap['videoUrl']))
            ..initialize().then((_) {
              // Ensure that the video starts playing once it's initialized
              videoController!.play();
              videoController!;
              videoController!.setLooping(true);
            });
    });

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  radius: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "${widget.snap['title']}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 0.5),
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Text(
              "${widget.snap['category']}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  letterSpacing: 0.5),
              maxLines: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 440,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(
                    videoController!,
                  ),
                  VideoProgressIndicator(
                    videoController!,
                    allowScrubbing: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${widget.snap['des']}",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.5),
              maxLines: 2,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "${widget.snap['location']}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  letterSpacing: 0.5),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
