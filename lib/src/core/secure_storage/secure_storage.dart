import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<void> write({required String key, required String value});

  Future<String?> read({required String key});

  Future<void> delete({required String key});

  Future<void> deleteAll();
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _secureStorage;
  const SecureStorageImpl(this._secureStorage);

  @override
  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(
      key: key,
      value: value,
      aOptions: _getAndroidOptions(),
    );
  }

  @override
  Future<String?> read({required String key}) async {
    return await _secureStorage.read(
      key: key,
      aOptions: _getAndroidOptions(),
    );
  }

  @override
  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }

  @override
  Future<void> deleteAll() async {
    await _secureStorage.deleteAll(
      aOptions: _getAndroidOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
