import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_report_app/presentation/splash/bloc/splash_state.dart';
import 'package:movie_report_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 1));

    emit(Authenticated());
    return;
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
