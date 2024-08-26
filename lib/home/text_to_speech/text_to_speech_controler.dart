import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TextToSpeechControler extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  Map? curentVoice;
  List<Map> voices = [];
  TextEditingController theText = TextEditingController();
}
