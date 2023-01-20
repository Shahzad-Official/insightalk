import 'package:get/get.dart';

class UsersScreenController extends GetxController {
  List<String> usersCategory = [
    "Top",
    "All",
    "New",
  ];
  String selectedUserCat = "Top";
  bool selectedVal = true;
  changeCat(value) {
    selectedUserCat = value;
    update();
  }

  changeValue(value) {
    selectedVal = value;
    update();
  }
}
