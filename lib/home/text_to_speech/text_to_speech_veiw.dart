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
    iniTTS();
    super.initState();
  }

  void iniTTS() {
    controler.flutterTts.getVoices.then((data) {
      try {
        controler.voices = List<Map>.from(data);

        setState(() {
          controler.curentVoice = controler.voices.first;
          setVoice(controler.curentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
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
            setVoice(controler.curentVoice!);
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
        _speakerSelctor(),
        TextField(
          controller: controler.theText,
        ),
      ],
    ));
  }

  Widget _speakerSelctor() {
    return DropdownButton(
      value: controler.curentVoice,
      items: controler.voices
          .map(
            (_voice) => DropdownMenuItem(
              value: _voice,
              child: Text(_voice["name"]),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          controler.curentVoice = value;
        });
      },
    );
  }
}
