import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadweer/core/helpers/app_logger.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    AppLogger.log(
      "SharedPrefHelper : Set data with key : $key and value : $value",
    );
    switch (value.runtimeType) {
      case String:
        await _prefs.setString(key, value);
        break;
      case int:
        await _prefs.setInt(key, value);
        break;
      case bool:
        await _prefs.setBool(key, value);
        break;
      case double:
        await _prefs.setDouble(key, value);
        break;
      case const (List<String>):
        await _prefs.setStringList(key, value);
        break;
      default:
        return;
    }
  }

  /// Gets an int value from SharedPreferences with given [key].
  static int? getInt({required String key}) {
    AppLogger.log('SharedPrefHelper : Get int with key : $key');
    return _prefs.getInt(key) ?? 0;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double? getDouble({required String key}) {
    AppLogger.log('SharedPrefHelper : Get double with key : $key');
    return _prefs.getDouble(key) ?? 0.0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static String? getString({required String key}) {
    AppLogger.log('SharedPrefHelper : Get string with key : $key');
    return _prefs.getString(key) ?? '';
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool? getBool({required String key}) {
    AppLogger.log('SharedPrefHelper : Get bool with key : $key');
    return _prefs.getBool(key) ?? false;
  }

  /// Gets a list values from SharedPreferences with given [key].
  static List<String>? getStringList({required String key}) {
    AppLogger.log('SharedPrefHelper : Get string list with key : $key');
    return _prefs.getStringList(key) ?? [];
  }

  /// Removes a value from SharedPreferences with given [key].
  static removeData({required String key}) async {
    AppLogger.log('SharedPrefHelper : Remove data with key : $key');
    await _prefs.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    AppLogger.log('SharedPrefHelper : Clear all data');
    await _prefs.clear();
  }
}
