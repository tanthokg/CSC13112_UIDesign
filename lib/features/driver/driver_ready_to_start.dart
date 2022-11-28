import 'package:flutter/material.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/widget/bottom_sheet_slidable.dart';

import '../../widget/simple_bottom_sheet.dart';

class DriverReadyToStartView extends StatefulWidget {
  const DriverReadyToStartView({Key? key}) : super(key: key);

  @override
  State<DriverReadyToStartView> createState() => _DriverReadyToStartViewState();
}

class _DriverReadyToStartViewState extends State<DriverReadyToStartView> {
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
          onPressed: () {},
          child: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(62, 150, 255, 1)),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      body: Stack(
        children: [const CurrentLocationView(),]
      ),

      bottomSheet: const SimpleBottomSheet(
        fullName: 'Huynh Van Khong',
        pickUp: '480 Nguyễn Thị Minh Khai',
        destination: '2212 Nguyen Thuong Hien',
      ),
    );
  }
}
