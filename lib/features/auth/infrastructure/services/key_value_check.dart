

///la <T> nos indica un dato generico, que dart lo reconoce y lo trata como tal
///T es diferente a Dynamic
abstract class KeyValueCheck {

  Future<void> setKeyValue<T> (String key, T value);
  Future<T?> getValue<T> (String key);
  Future<bool> removeKey (String key);


}