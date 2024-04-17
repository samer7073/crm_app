import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Profile.dart';
import 'package:flutter_application_stage_project/screens/containerDashbored.dart';

import 'package:flutter_application_stage_project/screens/ticket/ticket_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_stage_project/screens/settings/settings.dart';
import 'package:flutter_application_stage_project/screens/login_page.dart';

import 'package:flutter_application_stage_project/screens/chat_page.dart';

import 'package:flutter_application_stage_project/providers/theme_provider.dart';

import 'Activity_Projects/display_Activity_Page.dart';
import 'bottomNavigationBar.dart';
import 'detail/kanban_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ThemeProvider themeProvider;
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _tabController = TabController(length: 3, vsync: this);
    log("Init state activated: isDarkMode = ${themeProvider.isDarkMode}");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void signOut() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => LoginPage()));
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  }

  void goToSettingsPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Settings()));
  }

  void goToTicketPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Ticket()));
  }

  void goToChatPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
  }

  void goToKanbanPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => KanbanPage1()));
  }

  void goToChat() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: goToSettingsPage,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/face4.jpg'),
              radius: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text('Sphere'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Activity'),
            Tab(text: 'Ticket'),
            Tab(text: 'Deal'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_sharp, size: 30),
            onPressed: goToSettingsPage,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("data"),
          Column(
            children: [
              containerDashbored(
                tiltle: "Tickets",
                totale: "20",
                text1: "Resolu",
                nbText1: "15",
                text2: "Dépassé",
                nbText2: "5",
              ),
            ],
          ),
          Column(
            children: [
              containerDashbored(
                tiltle: "Deals",
                totale: "40",
                text1: "Done",
                nbText1: "15",
                text2: "Dépassé",
                nbText2: "5",
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(Index: selectedIndex),
    );
  }
}

class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}
