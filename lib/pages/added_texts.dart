import 'package:flutter/material.dart';
import 'package:generatorapp/main.dart';
import 'package:generatorapp/models/prefs_service.dart';

class AddedTexts extends StatefulWidget {
  final bool isEnglish;
  const AddedTexts({Key? key, required this.isEnglish}) : super(key: key);

  @override
  State<AddedTexts> createState() => _AddedTextsState();
}

class _AddedTextsState extends State<AddedTexts> {
  String? addedTexts;

  initializeText() async {
    String? addedText = widget.isEnglish ? await PrefsServices().getString(english): await PrefsServices().getString(korean);
    if (addedText != null) {
      addedTexts = addedText;
      if (mounted) setState(() {});
    }
  }

  @override
  void initState() {
    initializeText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Added texts"),
      ),
      body: SizedBox(
          child: Text(
        addedTexts ?? "",
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
