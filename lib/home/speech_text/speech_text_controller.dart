import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextController extends GetxController {
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String worldSpooken = "";
  double confidenceLevel = 0;
}
