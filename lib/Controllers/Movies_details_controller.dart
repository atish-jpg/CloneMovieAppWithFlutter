import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MoviesDetailsController extends GetxController {
  ChewieController? chewieController;
  bool isVisibleTrailerImages = true;
  bool isVisibleTrailerVideos = false;

  var link;
  @override
  void onInit() {
    super.onInit();
  }

  initializePlayer({link}) {
    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(link),
      autoInitialize: true,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, error) {
        return Container(
          child: Text("Sorry cant run videos"),
        );
      },
    );
  }

  Chewie playTrailers({link}) {
    initializePlayer(link: link);
    update();
    return Chewie(controller: chewieController!);
  }

  @override
  void onClose() {
    chewieController!.dispose();
    chewieController!.videoPlayerController.dispose();
    chewieController!.pause();
    chewieController!.videoPlayerController.pause();
    super.onClose();
  }
}