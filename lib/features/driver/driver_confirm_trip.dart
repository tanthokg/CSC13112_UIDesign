import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/map/current_location_screen.dart';
import 'package:uniride/widget/customer_pick_up_destination_card.dart';
import 'package:uniride/widget/driver_start_end_card.dart';

class DriverConfirmView extends StatefulWidget {
  const DriverConfirmView({Key? key}) : super(key: key);

  @override
  State<DriverConfirmView> createState() => _DriverConfirmViewState();
}

class _DriverConfirmViewState extends State<DriverConfirmView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác nhận chuyến xe'),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: Stack(
        children: [
          const CurrentLocationView(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              children: [
                // info card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // information customer
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/avatar/avatar-01.png',
                                  ),
                                  radius: 24,
                                ),
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                'Nguyen Van A',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: blackBlue,
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
                                margin: const EdgeInsets.only(top: 15, bottom: 5),
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
                        const SizedBox(height: 8,),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.red),
                                  color: Colors.white,
                                ),
                                height: 45,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Từ chối',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.driverReadyToStart);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blue,
                                  ),
                                  height: 45,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Đồng ý',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
