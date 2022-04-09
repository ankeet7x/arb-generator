import 'dart:convert';

import 'package:generatorapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices {
  setString(String key, String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async{
    final SharedPreferences  prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }


  addJson(Map<String, dynamic> json, bool isEnglish) async{
    String language = isEnglish ? english : korean;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentValue = prefs.getString(language);
    if (currentValue != null){
      Map<String, dynamic> jsonVal = jsonDecode(currentValue);
      jsonVal.addAll(json);
      prefs.setString(language, jsonEncode(jsonVal));
    }else{
      prefs.setString(language, jsonEncode(json));
    }
  }

}