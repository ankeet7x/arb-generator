import 'package:flutter/material.dart';
import 'package:generatorapp/models/arb_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: const Text("Arb generator"),
      ),
      body: Padding(padding:const EdgeInsets.all(8), child: Column(
        children: [
          TextFormField(
            controller: _textEditingController,
          ),
          ElevatedButton(onPressed: ()async{
            ArbModel arbModel = ArbModel(key: _textEditingController.text);
            print(await arbModel.toKoreanMap());
            print(arbModel.toEnglishMap());
          }, child: const Text("Add"))
        ],
      ),
      
      ),
      
    );
  }
}