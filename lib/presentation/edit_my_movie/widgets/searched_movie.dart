import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/common/widgets/movie/movie_card.dart';
import 'package:movie_report_app/common/widgets/tv/tv_card.dart';
import 'package:movie_report_app/presentation/edit_my_movie/bloc/edit_my_movie_cubit.dart';
import 'package:movie_report_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_report_app/presentation/search/bloc/search_state.dart';

class SearchedMovie extends StatelessWidget {
  const SearchedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MoviesLoadied) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                state.movies.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: MovieCard(
                    onTap: () => context
                        .read<EditMyMovieCubit>()
                        .selectedMovie(state.movies[index]),
                    isClicked:
                        context.read<EditMyMovieCubit>().state.movieEntity ==
                            state.movies[index],
                    movieEntity: state.movies[index],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is TvsLoaded) {
          return GridView.builder(
            itemCount: state.tvs.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return TVCard(tvEntity: state.tvs[index]);
            },
          );
        }
        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
