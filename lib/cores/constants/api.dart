class ApiEndpoint {
  static const _baseUrl = 'https://blackbox-tsaron.herokuapp.com/v2';

  static const String login = _baseUrl + '/drivers/login';
  static const String signUp = _baseUrl + '/drivers/sign.up';
  static const String forgotPassword = _baseUrl + '/drivers/forget.password';
  static const String resetPassword = _baseUrl + '/drivers/reset.password';
  static const String changePassword = _baseUrl + '/drivers/change/password';
  static const String getVehicle = _baseUrl + '/vehicles';
  static const String addVehicle = _baseUrl + '/vehicles';
  static String updateVehicle(String vehicleId) =>
      _baseUrl + '/vehicles/$vehicleId';
}
