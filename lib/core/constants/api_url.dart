class ApiUrl {
  // static const baseUrl =
  //     'https://netflix-backend-production-8413.up.railway.app/';

  // static const baseUrl = 'https://api.themoviedb.org/3/';
  static const baseUrl = 'http://localhost:3000/';

  static const apiV = 'api/v1/';
  static const signUp = '${apiV}auth/signup';
  static const signIn = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularTv = '${apiV}tv/popular';
  static const moive = '${apiV}movie/';
  static const trailerBaseUrl = 'https://www.youtube.com/watch?v=';
  static const tv = '${apiV}tv/';
  static const search = '${apiV}search/';

  // TMDB

  static const tmDBbaseUrl = 'https://api.themoviedb.org/3/';

  // static const tmDBAccessToken =
  //     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTZkY2EzMzNlYTdiNjk3M2U3ZDBmZTA5ZmMzYzE5NCIsIm5iZiI6MTc0MDc1MDkzOS4wMDQsInN1YiI6IjY3YzFjMDVhOWFkY2QyNTYyNTM1YzExMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3VG4OyKeC4gI3rKeZq6FUhp6w0ajbZEaleQjuf0wD94';

  // static const ACCOUNT_ID = '21849641';
  static const getTrendingMovie = "trending/movie/day?language=ko-KR";

  static const getNowPlayingMovies = "movie/now_playing";

  static const getMoive = '${tmDBbaseUrl}movie/';
  static const getMovieTrailer = "/videos?language=en-US";

  // static const getMovieDetails =
  //     "https://api.themoviedb.org/3/movie/${id}?language=en-US";
  static const getRecommendation = "recommendations?language=en-US&page=1";
  static const getSimilar = "similar?language=en-US&page=1";

  // static const getMoviesByCategory =
  //     "https://api.themoviedb.org/3/movie/${category}?language=en-US&page=1";

  static const getTv = '${tmDBbaseUrl}tv/';

  static const getTrendingTv =
      "https://api.themoviedb.org/3/trending/tv/day?language=en-US";
  static const getPopularTv = "${getTv}popular?language=en-US&page=1";
// static const getTvTrailers =`https://api.themoviedb.org/3/tv/${id}/videos?language=en-US`;
// static const getTvDetails =`https://api.themoviedb.org/3/tv/${id}?language=en-US`;

// static const getTvsByCategory =`https://api.themoviedb.org/3/tv/${category}?language=en-US&page=1`;

// delete
// static const getTvKeywords ="https://api.themoviedb.org/3/tv/${id}/keywords";
//static const getRecommendationTvs = "recommendations?language=en-US&page=1";
  // static const getSimilarTvs =
  //     "https://api.themoviedb.org/3/tv/${id}/similar?language=en-US&page=1";
}
