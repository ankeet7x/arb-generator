import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generatorapp/file_handling.dart';
import 'package:generatorapp/main.dart';
import 'package:generatorapp/models/arb_model.dart';
import 'package:generatorapp/models/prefs_service.dart';
import 'package:generatorapp/pages/added_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Arb generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_textEditingController.text != "") {
                    ArbModel arbModel =
                        ArbModel(key: _textEditingController.text);
                    PrefsServices().addJson(arbModel.toEnglishMap(), true);
                    PrefsServices()
                        .addJson(await arbModel.toKoreanMap(), false);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Added ${_textEditingController.text}")));
                    _textEditingController.clear();
                  }
                },
                child: const Text("Add")),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddedTexts(
                                isEnglish: true,
                              )));
                },
                child: const Text("Added English texts")),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddedTexts(
                                isEnglish: false,
                              )));
                },
                child: const Text("Added Korean texts")),
            ElevatedButton(
                onPressed: () async {
                  String? englishData =
                      await PrefsServices().getString(english) ?? "";
                  String? koreanData =
                      await PrefsServices().getString(korean) ?? "";
                  await FileHandlingServices().writeCounter(englishData, false);
                  await FileHandlingServices().writeCounter(koreanData, true);
                },
                child: Text("generate arb file"))
          ],
        ),
      ),
    );
  }
}
