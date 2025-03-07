import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_report_app/common/bloc/button/button_state.dart';
import 'package:movie_report_app/common/bloc/button/button_state_cubit.dart';
import 'package:movie_report_app/common/widgets/button/basic_reactive_button.dart';
import 'package:movie_report_app/common/widgets/custom_cahced_network_image.dart';
import 'package:movie_report_app/common/widgets/custom_expansion_card.dart';
import 'package:movie_report_app/common/widgets/custom_text_form_field.dart';
import 'package:movie_report_app/common/widgets/movie/movie_card.dart';
import 'package:movie_report_app/core/configs/theme/app_color.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/usecases/delete_my_movie_usecase.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_cubit.dart';
import 'package:movie_report_app/presentation/full_Image_screen.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_report_app/presentation/watch/widgets/video_vote_average.dart';
import 'package:movie_report_app/service_locator.dart';

class EditMyMoviePage extends StatelessWidget {
  const EditMyMoviePage({super.key, required this.myMovieEntity});
  final MyMovieEntity myMovieEntity;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtl =
        TextEditingController(text: myMovieEntity.title ?? '');
    String? remoteUrl =
        myMovieEntity.movieEntity?.getBackdropPathImagePath == null
            ? myMovieEntity.movieEntity?.getPosterPath()
            : myMovieEntity.movieEntity?.getBackdropPathImagePath!;

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(myMovieEntity.key),
      body: CustomScrollView(
        slivers: [
          if (remoteUrl != null)
            SliverPersistentHeader(
              delegate: SliverPersistentDelegate(remoteUrl: remoteUrl),
              pinned: true,
            ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: titleCtl,
                  ),
                  if (myMovieEntity.movieEntity != null)
                    MovieCard(movieEntity: myMovieEntity.movieEntity!),
                  // _movieInfo(movieEntity),

                  const SizedBox(height: 15 * 100),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  CustomExpansionCard _movieInfo(MovieEntity movieEntity) {
    return CustomExpansionCard(
      title: '영화 정보',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieEntity.title ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 30),
            if (movieEntity.overview != null) ...[
              VideoOverview(overview: movieEntity.overview!),
              const SizedBox(height: 30),
            ]
          ],
        ),
      ),
    );
  }

  SafeArea bottomNavigationBar(String myMovieKey) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  child: BackButton(),
                ),
                BlocProvider(
                  create: (context) => ButtonStateCubit(),
                  child: BlocListener<ButtonStateCubit, ButtonState>(
                    listener: (context, state) async {
                      if (state is ButtonLoadingState) {
                        await context
                            .read<CalendarCubit>()
                            .getMyMoviesByMonth();
                        Get.back();
                      }
                    },
                    child: SizedBox(
                      width: 80,
                      child: Builder(builder: (context) {
                        return BasicReactiveButton(
                          onPressed: () {
                            context.read<ButtonStateCubit>().excute(
                                usecase: sl<DeleteMyMovieUsecase>(),
                                params: myMovieKey);
                          },
                          title: '삭제',
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  PreferredSize _appBar(String remoteUrl) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(300),
      child: InkWell(
        onTap: () {
          Get.to(() => FullmageScreen(remoteUrl: remoteUrl));
        },
        child: Hero(
          tag: 'image',
          child: CustomCahcedNetworkImage(
            url: remoteUrl,
          ),
        ),
      ),
    );
  }
}

class SliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final String remoteUrl;
  final double maxImageSize = 300;
  final double minImageSize = 100;

  SliverPersistentDelegate({required this.remoteUrl});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FullmageScreen(remoteUrl: remoteUrl));
      },
      child: CustomCahcedNetworkImage(
        url: remoteUrl,
      ),
    );
    // return CustomCahcedNetworkImage(url: remoteUrl);
  }

  @override
  double get maxExtent => maxImageSize;

  @override
  double get minExtent => minImageSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
