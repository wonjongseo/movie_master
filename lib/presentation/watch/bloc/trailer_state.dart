import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoadied extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoadied({required this.youtubePlayerController});
}

class FailureLoadTrailer extends TrailerState {
  final String errorMessage;

  FailureLoadTrailer({required this.errorMessage});
}
