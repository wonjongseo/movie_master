import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

class MyMoviesPage extends StatelessWidget {
  const MyMoviesPage({super.key, required this.myMovies});
  final List<MyMovieEntity> myMovies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              if (myMovies[index].movieEntity != null)
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                      imageUrl: myMovies[index].movieEntity!.getPosterPath()),
                ),
              Text(myMovies[index].title ?? 'a'),
              Text(myMovies[index].movieEntity!.title ?? 'a'),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemCount: myMovies.length,
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [

      //     ],
      //   ),
      // ),
    );
  }
}
