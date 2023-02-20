import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/domain/model/login_user.dart';
import 'package:list_view/gui/login/bloc/login_bloc.dart';
import 'package:list_view/util/constants.dart';
import 'package:list_view/util/styles.dart';
import 'package:list_view/util/validation/input_validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with InputValidationMixin {
  late LoginBloc _loginBloc;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isEmailChanged = false;
  bool _isPasswordChanged = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    super.initState();
  }

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
      return AppLocalizations.of(context)!.emailValidationMessage;
    }
    return null;
  }

  String? get _passwordErrorText {
    final text = _passwordController.value.text;
    _isPasswordValid = text.isNotEmpty && isPasswordValid(text);
    if (!_isPasswordValid) {
      return AppLocalizations.of(context)!.passwordValidationMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.kinopoiskPremiers,
          style: Styles.navBarTitle,
        ),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(Constants.filmsScreen);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildEmailField(),
                  _buildPasswordField(),
                  _buildLoginButton(),
                  _buildProgressBar(state)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
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
          labelText: AppLocalizations.of(context)!.emailLabel,
          hintText: AppLocalizations.of(context)!.emailHint,
          errorText: _isEmailChanged ? _emailErrorText : null,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
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
          labelText: AppLocalizations.of(context)!.passwordLabel,
          hintText: AppLocalizations.of(context)!.passwordHint,
          errorText: _isPasswordChanged ? _passwordErrorText : null,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 70,
      width: 250,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: _isEveryFieldValid() ? _login : null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.loginLabel,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _buildProgressBar(LoginState state) {
    return Container(child: state is LoginLoading ? _buildLoading() : null);
  }

  void _login() {
    final loginUser = LoginUser(email: _emailController.text, password: _passwordController.text);
    _loginBloc.add(LoginButtonPressed(loginUser: loginUser));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  bool _isEveryFieldValid() {
    return _isEmailValid && _isPasswordValid;
  }
}
