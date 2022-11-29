import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/features/ride_track/completed_ride.dart';
import 'package:uniride/features/ride_track/custom_dialog.dart';

class BookerArrivedView extends StatefulWidget {
  const BookerArrivedView({super.key});

  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<BookerArrivedView> {

  late final showNoti;

  @override
  void initState() {
    showNoti = _showNotificationDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Demo Dialog')),
        body: FutureBuilder(
          future: _riderAccepted(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                const CurrentLocationView(),
                FutureBuilder(
                  future: showNoti,
                  builder: (context, snapshot) {
                    return Container();
                  },
                ),
              ],
            );
          },
        ));
  }

  Future<void> _riderAccepted() async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const CompletedRideView();
      }));
    });
  }

  Future<void> _showNotificationDialog() async {
    await Future.delayed(const Duration(seconds: 0)).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) => const CustomDialog(
          img: 'assets/illustration/green_checked.png',
          title: 'Chuyến xe đã kết thúc!',
          content: 'Hãy đánh giá chuyến xe và đóng góp ý kiến cho ứng dụng nhé!',
        ),
      );
    });
  }
}