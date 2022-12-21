import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniride/constants/colors.dart';

import '../book_ride/book_ride_list.dart';

class DetailCreatedTripView extends StatefulWidget {
  const DetailCreatedTripView({Key? key}) : super(key: key);

  @override
  State<DetailCreatedTripView> createState() => _DetailCreatedTripViewState();
}

class _DetailCreatedTripViewState extends State<DetailCreatedTripView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    color: blueSky,
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        const Expanded(
                          flex: 3,
                          child: Text(
                            'Thông tin chuyến xe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: IconButton(
                              icon: const Icon(
                                Icons.clear_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [

                        // Status chip
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Chip(
                              label: const Text('CÒN TRỐNG'),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              backgroundColor: Colors.grey.shade400,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),

                        // People information
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.personBiking,
                              color: blueSky,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: blueSky.shade100,
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/avatar/avatar-02.jpg'),
                                      radius: 16,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Nguyễn Văn A',
                                      style: TextStyle(
                                        color: blackBlue,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '(bạn)',
                                      style: TextStyle(
                                        color: blackBlue.shade400,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.person,
                              color: purple,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: purple.shade100,
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/avatar/default-avatar.png'),
                                      radius: 16,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Đang đợi ...',
                                      style: TextStyle(
                                        color: blackBlue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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

                        // Road
                        Image.asset('assets/images/empty_trip.png'),
                        const SizedBox(
                          height: 12,
                        ),

                        // Chip information
                        Row(
                          children: [
                            Expanded(flex: 2, child: Container()),
                            const Chip(
                              label: SizedBox(
                                height: 32,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Lái xe',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Chip(
                              backgroundColor: purple,
                              label: const SizedBox(
                                height: 32,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Đi nhờ xe',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 2, child: Container()),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),

                        // Distance of trip
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Quãng đường',
                                  style: TextStyle(
                                    color: blackBlue,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '5km',
                                  style: TextStyle(
                                    color: blackBlue,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.circle,
                                  size: 4,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '15 phút',
                                  style: TextStyle(
                                    color: blackBlue,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.radio_button_on_rounded,
                                      color: purple[900],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        child: CustomPaint(
                                          size: const Size(1, 32),
                                          painter: DashedLineVerticalPainter(
                                              purple[900]!),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: purple[900],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Điểm đón khách',
                                                style: TextStyle(
                                                  color: blackBlue.shade400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                '480 Nguyễn Thị Minh Khai',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: blackBlue,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Điểm trả khách',
                                                style: TextStyle(
                                                  color: blackBlue.shade400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                '311 Nguyễn Thượng Hiền',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: blackBlue,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),

                        // Time, price of tri[
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Thời gian',
                                  style: TextStyle(
                                    color: blackBlue,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        color: purple,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '17:31, 19/11/2022',
                                        style: TextStyle(
                                          color: blackBlue.shade400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Giá tiền',
                                      style: TextStyle(
                                        color: blackBlue.shade400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '7,000đ',
                                      style: TextStyle(
                                        color: blackBlue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),

                        // Buttons
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Đang đợi xác nhận'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                          ),
                        ),
                        const SizedBox(height: 24,),
                      ],
                    ),
                  ),
                ],
              ),

              // Card detail motorcycle
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
                child: SizedBox(
                  height: 90,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Mã chuyến xe', style: TextStyle(fontSize: 16, color: blackBlue),),
                              Text('ABCDEF123456', style: TextStyle(fontSize: 16, color: blackBlue.shade400),),
                            ],
                          ),
                          VerticalDivider(
                            color: blackBlue.shade400,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Loại chuyến xe', style: TextStyle(fontSize: 16, color: blackBlue),),
                              Text('Lái xe', style: TextStyle(fontSize: 16, color: blackBlue.shade400),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
