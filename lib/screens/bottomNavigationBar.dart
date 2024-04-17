// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/display_Activity_Page.dart';
import 'package:flutter_application_stage_project/screens/disscussions_page.dart';
import 'package:flutter_application_stage_project/screens/home_page.dart';
import 'package:flutter_application_stage_project/screens/settings/settings.dart';
import 'package:flutter_application_stage_project/screens/ticket/ticket_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Profile.dart';
import 'chat_page.dart';

import 'detail/kanban_page.dart';

class bottomNavigationBar extends StatefulWidget {
  final int Index;
  const bottomNavigationBar({super.key, required this.Index});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ProfilePage();
      },
    ));
  }

  void goToHomePage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return HomePage();
      },
    ));
  }

  void goToSettingsPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Settings();
      },
    ));
  }

  void goToTicketPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Ticket();
      },
    ));
  }

  void goToChatPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return DetailPage();
      },
    ));
  }

  void goToKanaban() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return KanbanPage1();
      },
    ));
  }

  void goTocha() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ChatPage();
      },
    ));
  }

  void goToDisc() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return DisscussionsPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.Index;
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      iconSize: 20,

      //unselectedLabelStyle: TextStyle(color: Colors.green),
      //showUnselectedLabels: true,
      //showSelectedLabels: true,

      //selectedItemColor: Colors.purple,
      /*
      unselectedIconTheme: IconThemeData(
          color:
              themeProvider.isDarkMode == true ? Colors.white : Colors.black),
      unselectedItemColor:
          themeProvider.isDarkMode == true ? Colors.white : Colors.black,
      //backgroundColor: Colors.green,
      */
      onTap: (int index) {
        setState(() {
          selectedIndex = index;

          if (index == 2) {
            // Navigate to ProfilePage when "Ticket" item is tapped
            goToTicketPage();
            selectedIndex = 0;
          } else if (index == 1) {
            goToChatPage();
            selectedIndex = 0;
          } else if (index == 3) {
            goToKanaban();
            selectedIndex = 0;
          } else if (index == 0) {
            goToHomePage();
          } else if (index == 4) {
            goToDisc();
          }
        });
        // selectedIndex = 0;
      },

      items: [
        BottomNavigationBarItem(
          // backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.pie_chart_outline_rounded,
            //color: selectedIndex == 0 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.pie_chart,
            //color: Colors.purple,
          ),
          label: "Overview",

          // TextStyle for unselected
          // TextStyle(color: selectedIndex == 0 ? Colors.purple : Colors.black),
        ),
        BottomNavigationBarItem(
          //backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.calendar_today_outlined,
            //color: selectedIndex == 1 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.calendar_today_rounded,
            //color: Colors.purple,
          ),
          label: AppLocalizations.of(context).activities,
        ),
        BottomNavigationBarItem(
          // backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.airplane_ticket_outlined,
            //color: selectedIndex == 2 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.airplane_ticket_rounded,
            // color: Colors.purple,
          ),
          label: AppLocalizations.of(context).tickets,
        ),
        BottomNavigationBarItem(
          //backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.handshake_outlined,
            // color: selectedIndex == 3 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.handshake_rounded,
            // color: Colors.purple,
          ),
          label: AppLocalizations.of(context).deals,
        ),
        BottomNavigationBarItem(
          //backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.chat_outlined,
            // color: selectedIndex == 3 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.chat_bubble_rounded,
            // color: Colors.purple,
          ),
          label: "Discussion",
        ),
      ],
      // selectedLabelStyle: TextStyle(color: Colors.green),
      //selectedItemColor: Colors.purple[900],
    );
  }
}
