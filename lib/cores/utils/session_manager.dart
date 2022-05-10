class SessionManager {
  SessionManager._internal();
  static final SessionManager instance = SessionManager._internal();
  factory SessionManager() => instance;

  static final Map<String, dynamic> _loginData = {};

  String get token => _loginData['access_token'] ?? '';
  String get sub => _loginData['sub'] ?? '';

  void setLoginData(Map<String, dynamic> data) {
    _loginData.clear();
    _loginData.addAll(data);
  }

  void clearLoginData() => _loginData.clear();
}
