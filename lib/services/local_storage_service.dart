import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  Future<void> saveData (String username) async { //kaydetme fonksiyonu
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("ls_name", username); 
  }

  Future<String> getData () async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("ls_name") ?? ""; // sol taraf null'sa boş değer dön
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("ls_name");
  }

}