import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/ride_track/waiting_rider.dart';
import 'package:uniride/widget/driver_information.dart';

import '../../constants/routes.dart';
import '../../entity/trip.dart';
import '../../widget/dash_line_vertical.dart';

class BookRideListView extends StatefulWidget {
  const BookRideListView({Key? key}) : super(key: key);

  @override
  State<BookRideListView> createState() => _BookRideListViewState();
}

class _BookRideListViewState extends State<BookRideListView> {
  var isBook = false;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    final trip = data['information'] as Trip;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Xác nhận chuyến xe'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.white,
          elevation: 3,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              DriverInformation(
                nameOfDriver: trip.rider,
              ),
              const SizedBox(
                height: 18,
              ),
              const _ContactWithDriver(),
              const SizedBox(
                height: 18,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 12,
              ),
              _EstimateCards(
                trip: trip,
              ),
              const SizedBox(
                height: 18,
              ),
              _RoadInformation(
                trip: trip,
              ),
              const SizedBox(
                height: 18,
              ),
              _TimeInformation(
                time: trip.startTime,
              ),
              const SizedBox(
                height: 6,
              ),
              _PayMethod(price: trip.price),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: isBook
                    ? FutureBuilder(
                        future: _riderAccepted(trip),
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '...',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          );
                        },
                      )
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            isBook = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: purple[900],
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(56),
                        ),
                        child: const Text(
                          'Đặt xe',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _riderAccepted(Trip trip) async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WaitingRiderView(
          trip: trip,
        );
      }));
    });
  }
}

class _PayMethod extends StatelessWidget {
  const _PayMethod({Key? key, required this.price}) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            '${NumberFormat('#,##0').format(price)}đ',
            style: TextStyle(
              color: blackBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeInformation extends StatelessWidget {
  const _TimeInformation({Key? key, required this.time}) : super(key: key);

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    color: blueSky,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${time.hour}:${time.minute}, ${time.day}/${time.month}/${time.year}',
                    style: TextStyle(
                      color: blackBlue.shade400,
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
                  Icon(
                    Icons.fast_forward_outlined,
                    color: blueSky,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Khách phải đặt trước 15 phút',
                    style: TextStyle(
                      color: blackBlue.shade400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoadInformation extends StatelessWidget {
  const _RoadInformation({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              '${trip.distance.toInt()}km',
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
              '${(trip.distance * 3).toInt()} phút',
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomPaint(
                      size: const Size(1, 32),
                      painter: DashedLineVerticalPainter(purple[900]!),
                    ),
                  ),
                ),
                Icon(
                  Icons.location_on_outlined,
                  color: purple[900],
                  size: 32,
                ),
              ],
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đón khách tại',
                    style: TextStyle(
                      color: blackBlue.shade400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    trip.pickupPoint ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blackBlue,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Trả khách tại',
                    style: TextStyle(
                      color: blackBlue.shade400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    trip.dropPoint ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blackBlue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EstimateCards extends StatelessWidget {
  const _EstimateCards({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cách điểm đón của bạn',
                    style: TextStyle(
                      fontSize: 16,
                      color: blackBlue.shade400,
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                    height: 4,
                    child: Divider(
                      thickness: 2,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '2km',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian đón dự kiến',
                    style: TextStyle(
                      fontSize: 16,
                      color: blackBlue.shade400,
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    height: 4,
                    child: Divider(
                      thickness: 2,
                      color: blueSky,
                    ),
                  ),
                  Text(
                    '${trip.startTime.add(const Duration(minutes: 5)).hour}:${trip.startTime.add(const Duration(minutes: 5)).minute}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian đi xe ước tính',
                    style: TextStyle(
                      fontSize: 16,
                      color: blackBlue.shade400,
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    height: 4,
                    child: Divider(
                      thickness: 2,
                      color: purple,
                    ),
                  ),
                  Text(
                    '${(trip.distance * 3).toInt()} phút',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactWithDriver extends StatelessWidget {
  const _ContactWithDriver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: blueSky,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: blueSky,
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
                color: blueSky,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: blueSky,
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
          height: 60,
          width: 60,
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
    );
  }
}
