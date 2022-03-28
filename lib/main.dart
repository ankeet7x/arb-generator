import 'package:flutter/material.dart';
import 'package:generatorapp/pages/home_page.dart';

void main(){
  runApp(MyApp());
}


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