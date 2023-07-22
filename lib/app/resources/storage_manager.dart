import "package:get_storage/get_storage.dart";

class StorageManager {
  final _box = GetStorage();

  // Store a value
  Future<void> setValue(String key, dynamic value) async {
    await _box.write(key, value);
  }

  // Retrieve a value
  dynamic getValue(String key) {
    return _box.read(key);
  }

  // Remove a value
  Future<void> removeValue(String key) async {
    await _box.remove(key);
  }

  // Store a model object
  Future<void> storeModel(String key, dynamic model) async {
    final json = model.toJson(); // Serialize the model to JSON
    await _box.write(key, json);
  }

  // Retrieve a model object
  T? retrieveModel<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final json = _box.read(key);
    if (json != null) {
      final Map<String, dynamic> data = Map<String, dynamic>.from(json);
      return fromJson(data); // Deserialize JSON to model object
    }
    return null;
  }

  // Remove a stored model object
  Future<void> removeModel(String key) async {
    await _box.remove(key);
  }

  Future<void> removeAll() async {
    await _box.erase();
  }
}

