import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniride/features/developing.dart';
import 'package:uniride/features/homepage/homepage.dart';
import 'package:uniride/features/notification/notification_list.dart';

import '../constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  var pages = [const HomePage(), const NotificationView(), const DevelopingView(), const DevelopingView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar/avatar-01.png'),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chào mừng',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: blackBlue.shade300,
                    ),
                  ),
                  Text(
                    'Nguyễn Văn A',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackBlue,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.grid_view_rounded,
                size: 24,
                color: blueSky,
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(
            color: blueSky.shade200,
          ),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: ''),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidBell,), label: '',),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icon/activity.png'), size: 32,), label: '',),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gear), label: '',),
          ],
        ),
        body: pages[_currentIndex],
      ),
    );
  }
}
