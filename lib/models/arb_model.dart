import 'package:generatorapp/converter.dart';

class ArbModel{
  String key;
  ArbModel({required this.key});

  Future<Map<String, dynamic>> toKoreanMap() async{
    String korean = await englishToKorean(key);
    return {key.replaceAll(" ", ""): korean};
  }

  Map<String, dynamic> toEnglishMap(){
    return {key.replaceAll(" ", ""): key};
  }
}