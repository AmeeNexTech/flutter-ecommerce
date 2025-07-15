import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalStorageService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<LocalStorageService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}
