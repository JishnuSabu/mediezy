import 'package:mediezy_task/features/auth/model/login_res_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  String? _token;
  int? _userId;
  String? _name;
  bool _isLoggedIn = false;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    _token = prefs.getString("token");
    _userId = prefs.getInt("userId");
    _name = prefs.getString("name");
  }

  bool get isLoggedInSync => _isLoggedIn;

  String? get token => _token;
  int? get userId => _userId;
  String? get userName => _name;

  Future<void> saveLoginData(LoginResponse res) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isLoggedIn", true);
    await prefs.setString("token", res.token);
    await prefs.setInt("userId", res.user.userId);
    await prefs.setString("name", res.user.firstName);

    _isLoggedIn = true;
    _token = res.token;
    _userId = res.user.userId;
    _name = res.user.firstName;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    _isLoggedIn = false;
    _token = null;
    _userId = null;
    _name = null;
  }
}