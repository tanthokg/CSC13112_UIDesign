import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/ride_track/driver_arrived.dart';
import 'package:uniride/widget/driver_information.dart';

class WaitingRiderView extends StatefulWidget {
  const WaitingRiderView({Key? key}) : super(key: key);

  @override
  State<WaitingRiderView> createState() => _WaitingRiderViewState();
}

class _WaitingRiderViewState extends State<WaitingRiderView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: _riderArrived(),
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Card(
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.radio_button_on,
                            color: purple,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vị trí chờ',
                                style: TextStyle(
                                  color: blackBlue.shade400,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '480 Nguyễn Thị Minh Khai',
                                style: TextStyle(
                                  color: blackBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Card(
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24)),
                      ),
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DriverInformation(),
                            const SizedBox(
                              height: 12,
                            ),

                            // thông tin thời gian đến
                            Row(
                              children: [
                                Icon(
                                  Icons.motorcycle_rounded,
                                  color: purple,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Tài xế của bạn sẽ đến trong ',
                                      style: TextStyle(
                                        color: blackBlue,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '2 phút',
                                      style: TextStyle(
                                        color: blackBlue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: purple,
                                        ),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      hintText: 'Gửi tin nhắn cho tài xế ...',
                                      hintStyle: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, Routes.chat);
                                        },
                                        icon: const Icon(
                                          Icons.send_rounded,
                                        ),
                                        color: purple,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: purple,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: 56,
                                  width: 56,
                                  decoration: BoxDecoration(
                                    border: const Border(),
                                    borderRadius: BorderRadius.circular(24),
                                    color: blueSky,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.phone_rounded,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.contact);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),

                            Text(
                              'Trong lúc đợi bạn có thể xem ...',
                              style: TextStyle(
                                color: blackBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/ad.png',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),

                            OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/cancel_trip/');
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size.fromHeight(56),
                                side: BorderSide(width: 2, color: red),
                              ),
                              child: Text(
                                'Hủy chuyến xe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _riderArrived() async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const DriverArrivedView();
      }));
    });
  }
}
