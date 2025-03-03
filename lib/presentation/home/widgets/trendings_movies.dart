import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_cubit.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:movie_report_app/presentation/home/widgets/category_text.dart';
import 'package:movie_report_app/presentation/see_more/pages/trending_movie_see_more.dart';

class TrendingsMovies extends StatelessWidget {
  const TrendingsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CategoryText(title: 'Trending 🔥'),
            BlocBuilder<TrendingsCubit, TrendingsState>(
                builder: (context, state) {
              if (state is TrendingsMoviesLoaded) {
                if (state.movies.length > 5) {
                  return TextButton(
                    onPressed: () {
                      AppNavigation.push(context, const TrendingMovieSeeMore());
                    },
                    child: const Text(
                      'See More....',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              }
              return Container();
            }),
          ],
        ),
        BlocBuilder<TrendingsCubit, TrendingsState>(
          builder: (context, state) {
            if (state is TrendingsMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TrendingsMoviesLoaded) {
              List<String> imagesLink = state.movies
                  .map((MovieEntity item) => item.providePosterPath())
                  .toList();

              return FanCarouselImageSlider.sliderType1(
                imagesLink: imagesLink.length > 5
                    ? imagesLink.sublist(0, 5)
                    : imagesLink,
                isAssets: false,
                autoPlay: false,
                sliderHeight: 400,
                showIndicator: true,
              );
            }
            if (state is FailureLoadTrendingsMovies) {
              return Text(state.errorMessage);
            }
            return Container();
          },
        ),
      ],
    );
  }
}
