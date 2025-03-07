import 'package:get_it/get_it.dart';
import 'package:movie_report_app/core/local/local_db_service.dart';
import 'package:movie_report_app/core/network/dio_client.dart';
import 'package:movie_report_app/core/network/tmdb_dio_client.dart';
import 'package:movie_report_app/data/auth/repositories/auth.dart';
import 'package:movie_report_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_report_app/data/movie/repositories/movie_repository.dart';
import 'package:movie_report_app/data/movie/sources/movie_service.dart';
import 'package:movie_report_app/data/my_movie/repositories/my_movie_repository.dart';
import 'package:movie_report_app/data/my_movie/sources/my_movie_service.dart';
import 'package:movie_report_app/data/tv/repositories/tv_repository.dart';
import 'package:movie_report_app/data/tv/sources/tv_service.dart';
import 'package:movie_report_app/domain/auth/repositories/auth.dart';
import 'package:movie_report_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_report_app/domain/auth/usecases/signin.dart';
import 'package:movie_report_app/domain/auth/usecases/signup.dart';
import 'package:movie_report_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_report_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_report_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_report_app/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:movie_report_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_report_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_report_app/domain/movie/usecases/search_movies.dart';
import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/domain/my_movie/usecases/get_all_my_movie_usecase.dart';
import 'package:movie_report_app/domain/my_movie/usecases/get_my_movie_by_month_usecase.dart';
import 'package:movie_report_app/domain/my_movie/usecases/insert_my_movie_usecase.dart';
import 'package:movie_report_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_report_app/domain/tv/usecases/get_tv_keywords.dart';
import 'package:movie_report_app/domain/tv/usecases/get_popular_tvs.dart';
import 'package:movie_report_app/domain/tv/usecases/get_recommendation_tvs.dart';
import 'package:movie_report_app/domain/tv/usecases/get_similar_tvs.dart';
import 'package:movie_report_app/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<TmDBDioClient>(TmDBDioClient());

  sl.registerSingleton<AuthService>(AuthServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<MyMovieService>(MyMovieServiceImpl());
  sl.registerSingleton<TvService>(TvApiServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<MyMovieRepository>(MyMovieRepositoryImpl());

  sl.registerSingleton<TvRepositoriy>(TvRepositoriesImpl());

  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMovies>(GetTrendingMovies());
  sl.registerSingleton<GetNowPlayingMovies>(GetNowPlayingMovies());
  sl.registerSingleton<GetPopularTvsUserCase>(GetPopularTvsUserCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUserCase>(
    GetRecommendationMoviesUserCase(),
  );
  sl.registerSingleton<GetSimilarMoviesUserCase>(GetSimilarMoviesUserCase());

  sl.registerSingleton<GetRecommendationTvsUserCase>(
      GetRecommendationTvsUserCase());
  sl.registerSingleton<GetSimilarTvUserCase>(GetSimilarTvUserCase());

  sl.registerSingleton<GetTvKeywordsUserCase>(GetTvKeywordsUserCase());
  sl.registerSingleton<SearchMoviesUseCase>(SearchMoviesUseCase());
  sl.registerSingleton<SearchTvUseCase>(SearchTvUseCase());
  sl.registerSingleton<GetAllMyMovieUsecase>(GetAllMyMovieUsecase());
  sl.registerSingleton<GetMyMovieByMonthUsecase>(GetMyMovieByMonthUsecase());
  sl.registerSingleton<InsertMyMovieUsecase>(InsertMyMovieUsecase());
}
