// TODO rewrite to Firebase Authentication
import 'package:injectable/injectable.dart';

@injectable
class UserRepository {
  bool hasToken = false;

  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    await Future.delayed(const Duration(seconds: 1));
    hasToken = false;
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(const Duration(seconds: 1));
    hasToken = true;
    return;
  }

  Future<bool> getToken() async {
    await Future.delayed(const Duration(seconds: 1));
    return hasToken;
  }
}
