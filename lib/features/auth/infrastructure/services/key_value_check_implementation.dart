import 'package:chequeo_f_h/features/auth/infrastructure/services/key_value_check.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueCheckImplementation extends KeyValueCheck{

  Future<SharedPreferences> getSharedPrefs () async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async{
    final prefs = await getSharedPrefs();

    switch(T) {
      case int:
        return prefs.getInt( key ) as T?;
        

      case String:
        return prefs.getString(key) as T?;
      
      default:
        throw UnimplementedError(
          "El envio no esta implementado para el tipo ${T.runtimeType}"
          );
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch(T) {
      case int:
        prefs.setInt(key, value as int);
        break;
      
      case String:
        prefs.setString(key, value as String);
        break;
      
      default:
        throw UnimplementedError(
          "No esta implementado para el tipo ${T.runtimeType}"
          );
    }
  }

}