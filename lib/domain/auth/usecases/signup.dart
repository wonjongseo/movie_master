import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/data/auth/models/signup_req_params.dart';
import 'package:movie_report_app/domain/auth/repositories/auth.dart';
import 'package:movie_report_app/service_locator.dart';

class SignupUsecase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
