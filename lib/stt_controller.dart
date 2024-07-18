// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController {
  final _speechToText = SpeechToText();
  bool _speechEnabled = false;

  //bool get isListening => _speechToText.isListening; //whether this is currently listening
  final isListening = false.obs;

  final words = <String>{}.obs; //the words recorded

  final searchResults = <String>[].obs;

  Future<void> enableSpeech() async {
    _speechEnabled = await _speechToText.initialize();
  }

  Future<void> startListening() async {
  	if(_speechEnabled){
    isListening.value = true;
    await _speechToText.listen(onResult: (result) {
      words.value = {result.recognizedWords, ...words};
      isListening.value = false;
    });
}
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    isListening.value = false;
  }

  void search(String query) {
    searchResults.value = words.value
        .where((value) => value.toLowerCase().contains(
              query.toLowerCase(),
            ))
        .toList();
  }


  void addWord(String word) => words.value = {word,...words};
}