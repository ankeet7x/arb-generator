import 'package:translator/translator.dart';

Future<String> englishToKorean(String input) async {
  final translator = GoogleTranslator();

  Translation translation =
      await translator.translate(input, to: 'ko');
  return translation.text;
}
