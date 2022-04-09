import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileHandlingServices{
  
  // to get local path
  Future<String> get _localPath async =>
  (Directory('/storage/emulated/0/Download')).path;

//   Future<String> get _localPath async{
// var dir = await getExternalStoragePublicDirectory();

// return dir.;
//   }
  
  Future<File> _localFile(bool isKorean) async {
  final path = await _localPath;
  print(path);
  return isKorean ? File("$path/app_ko.arb"): File('$path/app_en.arb');
}

  

  Future<File> writeCounter(String data, bool isKorean) async {
  final file = await _localFile(isKorean);
  // Write the file
  print("writing");
  return file.writeAsString(jsonEncode(data));
}


Future<String> readFile(bool isKorean) async {
  try {
    final file = await _localFile(isKorean);

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return "null";
  }
}

  //To get download folder
   static const MethodChannel _channel = MethodChannel('ext_storage');

   static Future<String> getExternalStoragePublicDirectory() async {
    if (!Platform.isAndroid) {
      throw UnsupportedError("Only android supported");
    }
    
    return await _channel
        .invokeMethod('getExternalStoragePublicDirectory', {"type": "Download"});
  }

}