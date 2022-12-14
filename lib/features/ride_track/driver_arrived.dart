import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/features/ride_track/booker_arrived.dart';
import 'package:uniride/features/ride_track/custom_dialog.dart';

import '../../entity/trip.dart';

class DriverArrivedView extends StatefulWidget {
  const DriverArrivedView({super.key, required this.trip});

  final Trip trip;

  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<DriverArrivedView> {
  late final Future<void> showNotification;

  @override
  void initState() {
    showNotification = _showNotificationDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _riderAccepted(widget.trip),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Go to Google Map'),
                ),
              ),
              FutureBuilder(
                future: showNotification,
                builder: (context, snapshot) {
                  return Container();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _riderAccepted(Trip trip) async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return BookerArrivedView(trip: trip,);
      }));
    });
  }

  Future<void> _showNotificationDialog() async {
    await Future.delayed(const Duration(seconds: 0)).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) => const CustomDialog(
          img: 'assets/illustration/green_checked.png',
          title: 'Người lái đã đến vị trí đón!',
          content: 'Chuyến xe của bạn sẽ được bắt đầu ngay bây giờ',
        ),
      );
    });
  }
}
