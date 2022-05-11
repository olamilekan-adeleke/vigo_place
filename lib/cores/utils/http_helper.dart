import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'logger.dart';
import 'session_manager.dart';

class HttpHelper {
  static final SessionManager _sessionManager = SessionManager();

  static Future<Map<String, dynamic>> get(String url) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + _sessionManager.token,
      };

      http.Response response = await http.get(Uri.parse(url), headers: headers);

      final Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      } else {
        throw result['message'];
      }
    } on FormatException catch (_) {
      throw 'Unable To Format Data!';
    } on SocketException catch (_) {
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + _sessionManager.token,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      } else {
        throw result['message'];
      }
    } on FormatException catch (_) {
      throw 'Unable To Format Data!';
    } on SocketException catch (_) {
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Map<String, dynamic>> patch({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + _sessionManager.token,
      };

      http.Response response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      } else {
        throw result['message'];
      }
    } on FormatException catch (_) {
      throw 'Unable To Format Data!';
    } on SocketException catch (_) {
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }
}
