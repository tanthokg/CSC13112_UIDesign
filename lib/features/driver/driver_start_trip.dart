import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/widget/bottom_sheet_slidable.dart';

import '../../widget/simple_bottom_sheet.dart';

class DriverStartView extends StatefulWidget {
  const DriverStartView({Key? key}) : super(key: key);

  @override
  State<DriverStartView> createState() => _DriverStartViewState();
}

class _DriverStartViewState extends State<DriverStartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10.0),
        height: 50,
        width: 50,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: const Color.fromRGBO(236, 245, 255, 1),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
              color: blueSky),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(children: const [
        CurrentLocationView(),
      ]),
      bottomSheet: const BottomSheetSlidable(
        fullName: 'Huynh Van Khong',
        pickUp: '480 Nguyễn Thị Minh Khai',
        destination: '2212 Nguyen Thuong Hien',
        buttonContent: 'Bắt đầu chuyến xe',
      ),
    );
  }
}
