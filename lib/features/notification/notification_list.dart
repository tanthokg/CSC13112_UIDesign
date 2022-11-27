import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/notification/notification_item.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
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
          items: const [
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: ''),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidBell,), label: '',),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icon/activity.png'), size: 32,), label: '',),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gear), label: '',),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // notification list
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext lContext, int index) {
                  return Column(
                    children: [
                      const NotificationItem(),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade300,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
