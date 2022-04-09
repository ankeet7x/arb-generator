import 'package:flutter/material.dart';
import 'package:generatorapp/pages/home_page.dart';

void main(){
  runApp(const MyApp());
}

const String english = "english";
const String korean = "korean";

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Arb generator",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}