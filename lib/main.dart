import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie_report_app/common/helper/app_string.dart';
import 'package:movie_report_app/core/configs/theme/app_theme.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_cubit.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_cubit.dart';
import 'package:movie_report_app/presentation/splash/bloc/splash_cublit.dart';
import 'package:movie_report_app/presentation/splash/pages/splash.dart';
import 'package:movie_report_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();

  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  Hive.registerAdapter(MyMovieEntityAdapter());

  await dotenv.load(fileName: '.env');
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
        ),
        BlocProvider(
          create: (context) => TrendingsCubit()..getTrendingMovies(1),
        ),
        BlocProvider(
            create: (context) => CalendarCubit()..getMyMoviesByMonth()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appLightTheme,
        home: const SplashPage(),
        fallbackLocale: const Locale('ko', 'KR'),
        translations: AppTranslations(),
        locale: Get.deviceLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

//flutter pub run build_runner build
