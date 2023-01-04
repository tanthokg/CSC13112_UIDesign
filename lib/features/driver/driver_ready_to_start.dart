// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/widget/customer_info.dart';

import 'package:uniride/widget/customer_pick_up_destination_card.dart';
import 'package:uniride/constants/colors.dart';

class DriverReadyToStartView extends StatefulWidget {
  const DriverReadyToStartView({Key? key}) : super(key: key);

  @override
  State<DriverReadyToStartView> createState() => _DriverReadyToStartViewState();
}

class _DriverReadyToStartViewState extends State<DriverReadyToStartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hành trình chuyến xe'),
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomerInfoCard(fullName: 'Huỳnh Văn Không'),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider(
                    color: Color.fromRGBO(236, 245, 255, 1),
                    thickness: 2,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.map, color: Colors.blue),
                        Text('Chỉ đường', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Quãng đường     '),
                    Expanded(
                        child: Divider(
                            color: Color.fromRGBO(236, 245, 255, 1),
                            thickness: 2)),
                    Text('     0km · 0 phút'),
                  ],
                ),
              ),
              const PickUpDestinationCard(
                pickUp: '480 Nguyễn Thị Minh Khai',
                destination: '200 Nguyễn Thượng Hiền',
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Text('Thời gian')),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 5),
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Icon(Icons.timer_sharp,
                          color: Color.fromRGBO(151, 71, 255, 1)),
                    ),
                    const Text('13/11/2022 - 18:00',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.driverStart);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size.fromHeight(56),
              ),
              backgroundColor: MaterialStateProperty.all(blueSky),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text(
              'Đã đến địa điểm đón',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ));
  }
}
