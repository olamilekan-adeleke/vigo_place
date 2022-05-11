import '../../../cores/constants/api.dart';
import '../../../cores/utils/http_helper.dart';

class SignUpRepository {
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> data) async {
    final Map<String, dynamic> response = await HttpHelper.post(
      url: ApiEndpoint.signUp,
      body: data,
    );

    return Map<String, dynamic>.from(response['data'] as Map);
  }
}
