import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/views/home_pages/home_screens/all_chats_screen.dart';
import 'package:insightalk/views/home_pages/home_screens/friends_screen.dart';
import 'package:insightalk/views/home_pages/home_screens/users_screen.dart';
import 'package:insightalk/views/home_pages/home_screens/profile_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> homeScreens = const [
    AllChatsScreen(),
    UsersScreen(),
    FriendsScreen(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: homeScreens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  currentIndex == 0
                      ? SvgIcons.chatIcon
                      : SvgIcons.inactiveChatIcon,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  SvgIcons.personIcon,
                  color:
                      currentIndex == 1 ? AppColors.primaryColor : Colors.grey,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  SvgIcons.friends,
                  color:
                      currentIndex == 2 ? AppColors.primaryColor : Colors.grey,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  SvgIcons.profile,
                  color:
                      currentIndex == 3 ? AppColors.primaryColor : Colors.grey,
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
