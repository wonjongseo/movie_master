import 'package:flutter/material.dart';
import 'package:movie_report_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_report_app/core/configs/theme/app_color.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/presentation/watch/pages/moive_watch.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {required this.movieEntity,
      super.key,
      this.width = 180,
      this.isClicked = false,
      this.onTap});
  final MovieEntity movieEntity;
  final double width;
  final bool isClicked;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            AppNavigation.push(
              context,
              MovieWatchPage(
                movieEntity: movieEntity,
              ),
            );
          },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              isClicked ? Border.all(color: AppColors.primary, width: 2) : null,
        ),
        child: AspectRatio(
          aspectRatio: .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(movieEntity.getPosterPath())),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieEntity.title!,
                        style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Text(
                            ' ${movieEntity.voteAverage!.toStringAsFixed(1)}',
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )
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
