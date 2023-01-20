import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GroupChatController extends GetxController {
  TextEditingController message = TextEditingController();
  File? imageFile;
  bool isImageClicked = false;
  bool isSelected = false;
  bool isRecording = false;
  bool isFocused = false;
  var imageIndex;
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
    isSelected = false;
    isFocused = false;

    update();
  }

  isRecordingaudio() {
    isRecording = !isRecording;
    update();
  }

  changeFocus(bool value) {
    isFocused = value;
    if (isFocused) {
      isSelected = false;
    }
    update();
  }

  addEmojiToMsg(String emoji) {
    message.text = emoji;
    update();
  }

  selectEmoji(context) {
    isSelected = !isSelected;
    if (isSelected) {
      isFocused = true;
      FocusScope.of(context).unfocus();
    }
    update();
  }

  addImageToList() {
    imageIndex = allMessages
        .where(
          (element) => element.contains("thisisimage"),
        )
        .toList();

    update();
  }

  openCamera() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (image != null) {
      addImageToList();
      imageFile = File(image.path);
    } else {
      isImageClicked = false;
    }
    update();
  }
}
