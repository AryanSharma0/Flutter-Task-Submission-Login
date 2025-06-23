import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../constants/api_constants.dart';

class ApiService extends GetxService {
  static ApiService get to => Get.find();

  final http.Client _client = http.Client();

  // Base headers for all requests
  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  /// Generic POST request method
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, String>? additionalHeaders,
  }) async {
    try {
      final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
      final headers = {..._headers, ...?additionalHeaders};

      final response = await _client
          .post(
            url,
            headers: headers,
            body: json.encode(data),
          )
          .timeout(const Duration(seconds: 30));

      return _handleResponse(response);
    } on SocketException {
      throw Exception('No internet connection');
    } on HttpException {
      throw Exception('HTTP error occurred');
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }

  /// Handle API response and error codes
  Map<String, dynamic> _handleResponse(http.Response response) {
    final data = json.decode(response.body) as Map<String, dynamic>;

    switch (response.statusCode) {
      case 200:
      case 201:
        return data;
      case 400:
        throw Exception(data['message'] ?? 'Bad request');
      case 401:
        throw Exception(data['message'] ?? 'Unauthorized access');
      case 404:
        throw Exception(data['message'] ?? 'Resource not found');
      case 500:
        throw Exception('Internal server error');
      default:
        throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void onClose() {
    _client.close();
    super.onClose();
  }
}
