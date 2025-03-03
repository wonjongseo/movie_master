import 'package:dartz/dartz.dart';
import 'package:movie_report_app/data/auth/models/signin_req_params.dart';

import 'package:movie_report_app/data/auth/models/signup_req_params.dart';
import 'package:movie_report_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_report_app/domain/auth/repositories/auth.dart';
import 'package:movie_report_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = data['user']['token'];

      sharedPreferences.setString('token', token);
      return Right(data);
    });
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthService>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String token = data['user']['token'];

      sharedPreferences.setString('token', token);
      return Right(data);
    });
  }

  @override
  Future<bool> isLoggedInignin() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    var token = shared.getString('token');
    if (token == null) {
      return false;
    }
    return true;
  }
}
