// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lms_voice_app/stt_controller.dart';

void main() {
  // test 1
  test('Test SpeechToText addWord()', () {
    final controller = SpeechToTextController();
    expect(controller.words, isEmpty); //expect that it initally empty

    controller.addWord('Hello,');

    expect(controller.words, isNotEmpty); // expect that list of words is not empty after adding a word
    });

  //test 2
  test('Test SpeechToTextController search Functionality', (){

    final controller = SpeechToTextController();
    expect(controller.searchResults, isEmpty); //expect that initially the search Results is empty 
    String query = "Okay"; // the search query

    controller.addWord(query); //add the search query
    expect(controller.words, isNotEmpty);

    controller.search(query); //search the query here
     //after adding word, expect that searchResults is not empty
    expect(controller.searchResults, isNotEmpty);

   });
}
