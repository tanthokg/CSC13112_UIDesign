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
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            Column(children: [
              // info card
              Card(
                child: Column(
                  children: [
                    // information customer
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset('assets/logo/facebook.png',
                                  width: 48, height: 48),
                            ),
                          ),
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
                  ],
                ),
              ),
            ]),

            const SizedBox(height: 12,),

            // the buttons

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.driverRating);
              },
              child: Text(
                'Đánh giá',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size.fromHeight(56),),
                backgroundColor: MaterialStateProperty.all(blueSky),
              ),
            ),

            const SizedBox(height: 12,),

            OutlinedButton(
              onPressed: () {
                /*final user = await UserDAO.instance.readUserByEmail(email);
                  if (mounted) {
                    Navigator.pushReplacementNamed(context, Routes.home,
                        arguments: {'name': user!.name});
                  }*/
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(
                  color: blueSky,
                  width: 2,
                ),),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor: MaterialStateProperty.all(blueSky),
                minimumSize: MaterialStateProperty.all(const Size.fromHeight(56),),
              ),
              child: const Text(
                'Đánh giá sau',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
