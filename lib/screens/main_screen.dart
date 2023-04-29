import 'package:flutter/material.dart';
import 'package:instagram/screens/home_page.dart';

import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile.dart';

import 'activity_screen.dart';
import 'add_story_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedBottomNavigationBar = index;
          });
        },
        currentIndex: _selectedBottomNavigationBar,
        backgroundColor: const Color(0xff272B40),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Item 1',
            icon: Image.asset('assets/images/icon_home.png'),
            activeIcon: Image.asset('assets/images/icon_active_home.png'),
          ),
          BottomNavigationBarItem(
            label: 'Item 2',
            icon: Image.asset('assets/images/icon_search_navigation.png'),
            activeIcon:
                Image.asset('assets/images/icon_search_navigation_active.png'),
          ),
          BottomNavigationBarItem(
            label: 'Item 3',
            icon: Image.asset('assets/images/icon_add_navigation.png'),
            activeIcon:
                Image.asset('assets/images/icon_add_navigation_active.png'),
          ),
          BottomNavigationBarItem(
            label: 'Item 4',
            icon: Image.asset('assets/images/icon_activity_navigation.png'),
            activeIcon: Image.asset(
                'assets/images/icon_activity_navigation_active.png'),
          ),
          BottomNavigationBarItem(
            label: 'Item 4',
            icon: SizedBox(
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset('assets/images/pbk.jpg'),
              ),
            ),
            activeIcon: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 2,
                  color: const Color(0xffF35383),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pbk.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _getLayout(),
    );
  }

  Widget _getLayout() {
    return IndexedStack(
      index: _selectedBottomNavigationBar,
      children: <Widget>[
        const HomePage(),
        SearchScreen(),
        AddStoryScreen(),
        const ActivityScreen(),
        const UserProfile(),
      ],
    );
  }
}
