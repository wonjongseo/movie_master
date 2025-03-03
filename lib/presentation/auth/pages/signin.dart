import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_report_app/common/helper/message/display_message.dart';
import 'package:movie_report_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_report_app/core/configs/theme/app_color.dart';
import 'package:movie_report_app/data/auth/models/signin_req_params.dart';
import 'package:movie_report_app/domain/auth/usecases/signin.dart';
import 'package:movie_report_app/presentation/auth/pages/signup.dart';
import 'package:movie_report_app/presentation/home/pages/home.dart';
import 'package:movie_report_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
            _signInText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 60),
            _signinButton(context),
            const SizedBox(height: 20),
            _signUpText(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text(
      'Sign in',
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

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign in',
      activeColor: AppColors.primary,
      onPressed: () async => await sl<SigninUseCase>().call(
        params: SigninReqParams(
          email: _emailCon.text,
          password: _passwordCon.text,
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        print('error.toString : ${error.toString()}');

        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Don't you have account?"),
          TextSpan(
            text: ' Sign Up',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(context, SignupPage());
              },
          )
        ],
      ),
    );
  }
}
