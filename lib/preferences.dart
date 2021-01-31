import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', "value");
  }

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('key');
    return stringValue;
  }
}
