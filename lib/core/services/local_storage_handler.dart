part of 'services.dart';

class LocalStorageHandler<T> {
  late Box<T> _box;
  late final String name;

  LocalStorageHandler({
    String name = '',
  }) {
    this.name = 'runtimeType${T.runtimeType.toString()}$name';
  }

  Future<void> delete() async {
    _box = await _openBox();
    _box.delete(0);
  }

  Future<T?> get() async {
    try {
      _box = await _openBox();
      return _box.get(0);
    } on Exception {
      return null;
    }
  }

  Future<bool> set(T data) async {
    _box = await _openBox();
    await _box.put(0, data);
    return true;
  }

  _openBox() async => _box = await Hive.openBox<T>(name);
}
