import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/widget/bottom_sheet_slidable.dart';

import '../../widget/simple_bottom_sheet.dart';

class DriverEndView extends StatefulWidget {
  const DriverEndView({Key? key}) : super(key: key);

  @override
  State<DriverEndView> createState() => _DriverEndViewState();
}

class _DriverEndViewState extends State<DriverEndView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.small(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
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

      body: Stack(
        children: [const CurrentLocationView(),]
      ),

      bottomSheet: const BottomSheetSlidable(
        fullName: 'Huynh Van Khong',
        pickUp: '480 Nguyễn Thị Minh Khai',
        destination: '2212 Nguyen Thuong Hien',
        buttonContent: 'Kết thúc chuyến xe',
      ),
    );
  }
}
