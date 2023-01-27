
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage{
  static final _storage = new FlutterSecureStorage();
  static const _keyId = 'id';

  static Future setId(int id) async =>
      await _storage.write(key: _keyId, value: id.toString());

  static Future<String?> getId() async {
    await _storage.read(key: _keyId);
  }

}