import 'package:flutter/material.dart';
import 'package:recipe/constants/routes.dart';
import 'package:recipe/page/notifcation.dart';
import 'package:recipe/page/search.dart';
import 'package:recipe/page/dashBoard.dart';
import 'package:recipe/page/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  final List<Widget> screens = const [
    DashBoard(),
    Search(),
    Notify(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const DashBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            createRecipeRoute,
            (route) => false,
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = const DashBoard();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dashboard,
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                            Text('DashBoard',
                                style: TextStyle(
                                    color: currentTab == 0
                                        ? Colors.blue
                                        : Colors.grey))
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = const Search();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey,
                            ),
                            Text('Search',
                                style: TextStyle(
                                    color: currentTab == 1
                                        ? Colors.blue
                                        : Colors.grey))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = const Notify();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notification_add,
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                            ),
                            Text('Notification',
                                style: TextStyle(
                                    color: currentTab == 3
                                        ? Colors.blue
                                        : Colors.grey))
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = const Profile();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color:
                                  currentTab == 4 ? Colors.blue : Colors.grey,
                            ),
                            Text('Profile',
                                style: TextStyle(
                                    color: currentTab == 4
                                        ? Colors.blue
                                        : Colors.grey))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
