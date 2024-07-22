
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_voice_app/stt_controller.dart';

class WordListScreen extends GetWidget<SpeechToTextController> {
  const WordListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word history'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Obx(() {
          final words = controller.searchResults.isNotEmpty
              ? controller.searchResults
              : controller.words.toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF222222),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextField(
                    onChanged: (value) => controller.search(value),
                    
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        
                        isDense: true,
                        hintText: 'Search word history.',

                        contentPadding: EdgeInsets.all(15),
                        suffixIcon: Icon(Icons.search, size: 20, color: Colors.white),
                        ),
                  )),
              ...List.generate(
                  words.length,
                  (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          '${i + 1}.  	${words[i]}',
                          //textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
            ],
          );
        }),
      ),
    );
  }
}
