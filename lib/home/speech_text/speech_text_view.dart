import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:task6/home/speech_text/speech_text_controller.dart';

class SpeechText extends StatefulWidget {
  const SpeechText({super.key});

  @override
  State<SpeechText> createState() => _SpeechTextState();
}

class _SpeechTextState extends State<SpeechText> {
  var controller = Get.put(SpeechTextController());
  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: Text(
                  controller.speechToText.isListening
                      ? "Listening..."
                      : controller.speechEnabled
                          ? "tap to mic to start listening..."
                          : "speech not avalable",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Text(
                controller.worldSpooken,
                style: TextStyle(fontSize: 25),
              ),
            )),
            if (controller.speechToText.isNotListening &&
                controller.confidenceLevel > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Text(
                  "Confidence: ${(controller.confidenceLevel * 100).toStringAsFixed(1)}%",
                  style: TextStyle(fontSize: 25),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.speechToText.isListening
            ? _stopListening
            : _startListening,
        backgroundColor: Colors.red,
        child: Icon(
            controller.speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }

  void initSpeech() async {
    controller.speechEnabled = await controller.speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await controller.speechToText
        .listen(onResult: _onSpeechResult, localeId: "ar");
    setState(() {
      controller.confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await controller.speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult Result) {
    setState(() {
      controller.worldSpooken = Result.recognizedWords;
      controller.confidenceLevel = Result.confidence;
    });
  }
}
