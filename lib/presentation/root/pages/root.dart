import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movie_report_app/presentation/calendar/pages/calendar_back.dart';
import 'package:movie_report_app/presentation/calendar/pages/calendar_page.dart';
import 'package:movie_report_app/presentation/add_my_movie/pages/add_my_movie_page.dart';
import 'package:movie_report_app/presentation/home/pages/home.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    int _currentIndex = 0;
    List<Widget> _buildScreens = [
      const CalendarPage(),
      HomePage(),
      AddMyMoviePage(),
      Text('data2'),
      Text('data3')
    ];

    return PersistentTabView(
      context,
      padding: const EdgeInsets.only(top: 8),
      controller: _controller,
      screens: _buildScreens,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style15,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.pink,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.movie),
        title: ("Movies"),
        activeColorPrimary: Colors.pink,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add, color: Colors.white),
        activeColorPrimary: Colors.pinkAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.pink,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.pink,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
