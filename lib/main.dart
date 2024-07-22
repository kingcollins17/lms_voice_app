import 'package:flutter/material.dart';
import 'package:lms_voice_app/constants.dart';
import 'package:lms_voice_app/stt_controller.dart';

import 'package:get/get.dart';

import 'screens/voice_to_word_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SpeechToTextController()..enableSpeech());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      darkTheme: theme,
      home: const VoiceToWordScreen(),
    );
  }
}

