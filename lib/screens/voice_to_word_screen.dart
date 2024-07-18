
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_voice_app/constants.dart';
import 'package:lms_voice_app/screens/words_list_screen.dart';
import 'package:lms_voice_app/stt_controller.dart';

class VoiceToWordScreen extends StatelessWidget {
  const VoiceToWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SpeechToTextController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice to Text'),
        actions: [
          GestureDetector(
          	onTap: () => Get.to(const WordListScreen()),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Text(
                  'Word history',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Icon(Icons.history, size: 20),
                SizedBox(width: 10)
              ]),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 30),
            Obx(
              () => Text(
                controller.isListening.value ? 'Listening ..' : 'Tap the button to say something',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return Center(
                  child: controller.isListening.value
                      ? const SpinKitWave(size: 50, color: Colors.white)
                      : Text(
                          controller.words.isNotEmpty ? controller.words.first : 'Nothing yet',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                );
              }),
            ),
            const RecordingButton(),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

class RecordingButton extends GetWidget<SpeechToTextController> {
  const RecordingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
          onTap:
              controller.isListening.value ? controller.stopListening : controller.startListening,
          child: Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: roman),
            child: Center(
              child: controller.isListening.value
                  ? const Icon(Icons.mic, size: 20, color: Colors.white)
                  : Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
            ),
          ));
    });
  }
}
