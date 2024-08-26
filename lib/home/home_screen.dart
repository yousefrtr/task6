import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task6/home/speech_text/speech_text_view.dart';
import 'package:task6/home/text_to_speech/text_to_speech_veiw.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TheButtone("speech to text", () {
            Get.to(SpeechText());
          }),
          TheButtone("text to speech", () {
            Get.to(TextToSpeech());
          }),
        ],
      )),
    );
  }

  Widget TheButtone(String title, Function()) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
          child: Container(
            height: 30,
            child: Center(
              child: Text(title),
            ),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(30)),
          ),
          onTap: Function),
    );
  }
}
