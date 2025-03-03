import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/data/auth/models/signin_req_params.dart';
import 'package:movie_report_app/domain/auth/repositories/auth.dart';
import 'package:movie_report_app/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedInignin();
  }
}
