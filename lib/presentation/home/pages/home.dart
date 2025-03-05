import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_report_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_report_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_report_app/core/configs/assets/app_vectors.dart';
import 'package:movie_report_app/presentation/home/widgets/category_text.dart';
import 'package:movie_report_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_report_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_report_app/presentation/home/widgets/trendings_movies.dart';
import 'package:movie_report_app/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
            onPressed: () {
              AppNavigation.push(context, const SearchPage());
            },
            icon: const Icon(Icons.search)),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingsMovies(),
            SizedBox(height: 32),
            CategoryText(title: 'New Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 32),
            CategoryText(title: 'Popular TV'),
            SizedBox(height: 16),
            PopularTv(),
            SizedBox(height: 16),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
