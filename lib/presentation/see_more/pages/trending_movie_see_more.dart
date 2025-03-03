import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_report_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_report_app/common/widgets/movie/movie_card.dart';
import 'package:movie_report_app/core/network/tmdb_dio_client.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_cubit.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_state.dart';
import 'package:movie_report_app/service_locator.dart';

class TrendingMovieSeeMore extends StatefulWidget {
  const TrendingMovieSeeMore({super.key});

  @override
  State<TrendingMovieSeeMore> createState() => _TrendingMovieSeeMoreState();
}

class _TrendingMovieSeeMoreState extends State<TrendingMovieSeeMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Trending Movies'),
      ),
      body: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingsMoviesLoaded) {
            return GridView.builder(
              itemCount: state.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: .6,
              ),
              itemBuilder: (context, index) {
                return MovieCard(movieEntity: state.movies[index]);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
