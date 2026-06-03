import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  bool _isLoggedIn = false;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  }

  bool get isLoggedInSync => _isLoggedIn;

  Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isLoggedIn", true);
    _isLoggedIn = true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
    _isLoggedIn = false;
  }
}