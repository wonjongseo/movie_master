import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_report_app/common/helper/message/display_message.dart';
import 'package:movie_report_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_report_app/core/configs/theme/app_color.dart';
import 'package:movie_report_app/data/auth/models/signup_req_params.dart';
import 'package:movie_report_app/data/auth/repositories/auth.dart';
import 'package:movie_report_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_report_app/domain/auth/usecases/signup.dart';
import 'package:movie_report_app/presentation/auth/pages/signin.dart';
import 'package:movie_report_app/presentation/auth/pages/signup.dart';
import 'package:movie_report_app/presentation/home/pages/home.dart';
import 'package:movie_report_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _emailCon =
      TextEditingController(text: 'visionwill3322@gmail.com');
  final TextEditingController _passwordCon =
      TextEditingController(text: '123123');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signUpText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 60),
            _signupButton(context),
            const SizedBox(height: 20),
            _signInText(context),
          ],
        ),
      ),
    );
  }

  Widget _signUpText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign in',
      activeColor: AppColors.primary,
      onPressed: () async => await sl<SignupUsecase>().call(
        params:
            SignupReqParams(email: _emailCon.text, password: _passwordCon.text),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Do you have account?"),
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(context, SigninPage());
              },
          )
        ],
      ),
    );
  }
}
