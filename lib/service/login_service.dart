import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'admin' && password == 'admin') {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      isLogin = true;
    } if (username == 'user' && password == 'user') {
      await UserInfo().setToken("user");
      await UserInfo().setUserID("2");
      await UserInfo().setUsername("user");
      isLogin = true;
    }
    return isLogin;
  }
}