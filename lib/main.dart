import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_report_app/core/configs/theme/app_theme.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_cubit.dart';
import 'package:movie_report_app/presentation/splash/bloc/splash_cublit.dart';
import 'package:movie_report_app/presentation/splash/pages/splash.dart';
import 'package:movie_report_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
