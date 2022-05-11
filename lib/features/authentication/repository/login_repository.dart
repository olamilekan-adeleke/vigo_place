import 'package:vigo_place/cores/constants/api.dart';

import '../../../cores/utils/http_helper.dart';

class LoginRepository {
  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> data) async {
    final Map<String, dynamic> response = await HttpHelper.post(
      url: ApiEndpoint.login,
      body: data,
    );

    return Map<String, dynamic>.from(response['data'] as Map);
  }
}
