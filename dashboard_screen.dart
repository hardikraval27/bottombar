import 'package:flutter/material.dart';
import 'package:teamui/screen/chat_screen.dart';
import 'package:teamui/screen/homepage.dart';
import 'package:teamui/screen/like_screen.dart';
import 'package:teamui/screen/profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;
  List bottom = [
    {
      "icon": "images/Group 307.png",
      "title": "Discover",
    },
    {
      "icon": "images/Vector (4).png",
      "title": "Like",
    },
    {
      "icon": "images/Vector (3).png",
      "title": "Chat",
    },
    {
      "icon": "images/Frame.png",
      "title": "Profile",
    }
  ];
  List screens = [
    Homepage(),
    LikeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: screens[selectedIndex],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10.0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottom.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Color(0xffFFEFF0)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        bottom[index]["icon"],
                        // selectedIndex != 0
                        //     ? Assets.iconsUnselectDashIcon
                        //     : Assets.iconsSelectDashIcon,
                        height: 25,
                        width: 25,
                        matchTextDirection: true,
                        color: selectedIndex == index
                            ? Color(0xffF24451)
                            : Color(0xffDADADA),
                      ),
                      Visibility(
                        visible: selectedIndex == index,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            bottom[index]["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffF24451),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
