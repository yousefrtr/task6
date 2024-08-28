import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:task6/home/text_to_speech/text_to_speech_controler.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  var controler = Get.put(TextToSpeechControler());

  @override
  void initState() {
    super.initState();
  }

  void setVoice(Map voice) {
    controler.flutterTts
        .setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            setVoice({"name": "ar-AE-SMTm00", "locale": "ara-x-lvariant-m00"});

            controler.flutterTts.speak(controler.theText.text);
          });
        },
        child: Icon(Icons.speaker),
      ),
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Text("tap to a speaker to speech the text"),
        ),
        Container(
          child: TextField(
            controller: controler.theText,
          ),
        ),
      ],
    ));
  }
}
