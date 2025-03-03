import 'package:flutter/material.dart';
import 'package:movie_report_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_report_app/domain/tv/entities/tv.dart';
import 'package:movie_report_app/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie_report_app/presentation/watch/widgets/recommendation_tvs.dart';
import 'package:movie_report_app/presentation/watch/widgets/similar_tvs.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_title.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  const TvWatchPage({super.key, required this.tvEntity});
  final TVEntity tvEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VideoPlayerBody(movieId: tvEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(height: 16),
            TvKeywords(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            const SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(height: 16),
            RecommendationTvs(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            SimilarTvs(tvId: tvEntity.id!),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
