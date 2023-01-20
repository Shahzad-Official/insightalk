import 'package:get/get.dart';

class ChatRatingController extends GetxController {
  List<String> ratings = [
    "Empathic",
    "Intelligent",
    "Funny",
    "Normal",
    "Sweet",
    "Negative",
  ];
  List<String> ratingsIcons = [
    "assets/empathic.png",
    "assets/intelligent.png",
    "assets/lol.png",
    "assets/normal.png",
    "assets/heart.png",
    "assets/cross.png",
  ];
  List<bool> isSelectedItem = [
    false,
    false,
    false,
    false,
    false,
    true,
  ];
  changeSelectedItem(index) {
    isSelectedItem[index] = !isSelectedItem[index];
    update();
  }
}
