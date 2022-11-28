import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/widget/driver_start_end_card.dart';

import '../../widget/customer_pick_up_destination_card.dart';

class DriverFinishView extends StatefulWidget {
  const DriverFinishView({Key? key}) : super(key: key);

  @override
  State<DriverFinishView> createState() => _DriverFinishViewState();
}

class _DriverFinishViewState extends State<DriverFinishView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 245, 255, 1),
      appBar: AppBar(
          title: const Text('Hoàn tất chuyến xe'),
          centerTitle: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ))),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // info card
                  Container(
                    //height: 500,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // information customer
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            //mainAxisSize: MainAxisSize.s,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset('assets/logo/facebook.png',
                                      width: 60, height: 60),
                                ),
                              ),
                              const Text(
                                'Nguyen Van A',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // customer pick up - destination
                        const PickUpDestinationCard(
                            pickUp: '480 Nguyen Thi Minh Khai',
                            destination: '2212 Nguyen Thuong Hien'),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Divider(
                              color: Color.fromRGBO(236, 245, 255, 1),
                              thickness: 2,
                            )),

                        // driver trip info
                        const DriverStartEndCard(
                          mainStartAddress: 'ĐH Khoa học Tự nhiên',
                          additionalStartAddress:
                              '227 Nguyễn Văn Cừ, Phường 4, Quận 5',
                          mainEndAddress: '410 Nguyễn Đình Chiểu',
                          additionalEndAddress: 'Phường 4, Quận 3',
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Divider(
                            color: Color.fromRGBO(236, 245, 255, 1),
                            thickness: 2,
                          ),
                        ),

                        // three icon rows
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Icon(Icons.info_outline,
                                          color: Colors.blue),
                                    ),
                                    const Text('13/11/2022 - 17:30',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Icon(Icons.motorcycle_sharp,
                                          color: Colors.blue),
                                    ),
                                    const Text('5.0km',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Icon(Icons.timer_sharp,
                                          color: Colors.blue),
                                    ),
                                    const Text('17:30 - 18:05',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text('Giá tiền',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                    Text('7,000đ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),

          // the buttons

          InkWell(
            onTap: () { Navigator.pushNamed(context, Routes.driverRating);},
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: blueSky,
                ),
                height: 50,
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Đánh giá',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          


          Container(
              margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue),
                  color: const Color.fromRGBO(236, 245, 255, 1),
                ),
                height: 50,
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Đánh giá sau',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blue),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
