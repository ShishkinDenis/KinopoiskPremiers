import 'package:flutter/material.dart';
import 'package:list_view/domain/model/LoginUser.dart';
import 'package:list_view/gui/films/films.dart';
import 'package:list_view/util/validation/InputValidationMixin.dart';
import '../../util/strings.dart';
import '../../util/styles.dart';

//TODO bloc
//TODO use go_Router
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with InputValidationMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isEmailChanged = false;
  bool _isPasswordChanged = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? get _emailErrorText {
    final text = _emailController.value.text;
    _isEmailValid = text.isNotEmpty && isEmailValid(text);
    if (!_isEmailValid) {
      return Strings.emailValidationMessage;
    }
    return null;
  }

  String? get _passwordErrorText {
    final text = _passwordController.value.text;
    _isPasswordValid = text.isNotEmpty && isPasswordValid(text);
    if (!_isPasswordValid) {
      return Strings.passwordValidationMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.kinopoiskPremiers,
          style: Styles.navBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) => setState(() {
                  _isEmailChanged = true;
                }),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: Strings.emailLabel,
                    hintText: Strings.emailHint,
                    errorText: _isEmailChanged ? _emailErrorText : null),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: TextField(
                controller: _passwordController,
                onChanged: (text) => setState(() {
                  _isPasswordChanged = true;
                }),
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: Strings.passwordLabel,
                    hintText: Strings.passwordHint,
                    errorText: _isPasswordChanged ? _passwordErrorText : null),
              ),
            ),
            Container(
              height: 70,
              width: 250,
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: _isEveryFieldValid() ? _goToFilmsScreen : null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  Strings.loginLabel,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _goToFilmsScreen() {
    LoginUser loginUser =
        LoginUser(email: _emailController.text, password: _passwordController.text);
    Navigator.push(context, MaterialPageRoute(builder: (_) => const FilmsScreen()));
  }

  bool _isEveryFieldValid() {
    return _isEmailValid && _isPasswordValid;
  }
}
