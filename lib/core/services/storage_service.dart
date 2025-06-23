import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late final FlutterSecureStorage _secureStorage;

  // Add static init method for Get.putAsync()
  static Future<StorageService> init() async {
    final service = StorageService();
    await service._initialize();
    return service;
  }

  Future<void> _initialize() async {
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    print('StorageService initialized');
  }

  /// Store authentication token securely
  Future<void> storeToken(String token) async {
    try {
      await _secureStorage.write(key: 'auth_token', value: token);
    } catch (e) {
      throw Exception('Failed to store token: $e');
    }
  }

  /// Retrieve authentication token
  Future<String?> getToken() async {
    try {
      return await _secureStorage.read(key: 'auth_token');
    } catch (e) {
      return null;
    }
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Clear all stored data (logout)
  Future<void> clearStorage() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      throw Exception('Failed to clear storage: $e');
    }
  }
}
