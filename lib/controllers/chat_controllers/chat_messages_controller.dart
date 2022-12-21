import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatMessagesController extends GetxController {
  TextEditingController message = TextEditingController();
  bool isFocused = true;
  bool isRecording = false;
  List<String> allMessages = [
    "hello",
    "Nice to meet you",
    "hey bro what'supp",
    "Welcome",
    "nice",
    "im fine you",
    "how are you",
    "hello23",
  ];
  addMessage(context) {
    allMessages.add(message.text);
    FocusScope.of(context).unfocus();
    message.text = '';

    update();
  }

  isRecordingaudio() {
    isRecording = !isRecording;
    update();
  }
}
