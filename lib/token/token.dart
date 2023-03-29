import '../core.dart';

Future<bool> getStatus(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}

Future<bool> putStatus(String key, bool value) async {
  print('$key ::  $value');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool(key, value);
}

Future<String> getStorage(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<bool> putStorage(String key, String value) async {
  print('$key ::  $value');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}

Future<bool> removeStorage(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove(key);
}

Future<bool> clearStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.clear();
}

readSPObject(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _var = prefs.getString(key);
  if (_var != null) return json.decode(_var);
  return null;
}

saveSPObject(String key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, json.encode(value));
}
