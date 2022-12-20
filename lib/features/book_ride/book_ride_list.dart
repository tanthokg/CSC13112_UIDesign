import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/map/simple_map.dart';
import 'package:uniride/features/ride_track/waiting_rider.dart';
import 'package:uniride/widget/driver_information.dart';

import '../../constants/routes.dart';

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Xác nhận chuyến xe'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: purple.shade100,
          elevation: 3,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const DriverInformation(),
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
              const _EstimateCards(),
              const SizedBox(
                height: 18,
              ),
              const _RoadInformation(),
              const SizedBox(
                height: 18,
              ),
              _TimeInformation(time: data['information'][2],),
              const SizedBox(
                height: 6,
              ),
              _PayMethod(price: data['information'][1]),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: isBook
                    ? FutureBuilder(
                        future: _riderAccepted(),
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

  Future<void> _riderAccepted() async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WaitingRiderView();
      }));
    });
  }
}

class _PayMethod extends StatelessWidget {
  const _PayMethod({Key? key, required this.price}) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Hình thức thanh toán',
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
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Icon(
                Icons.money_outlined,
                color: purple,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Tiền mặt',
                style: TextStyle(fontSize: 16, color: blackBlue),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
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
            price,
            style: TextStyle(
              color: blackBlue,
              fontSize: 20,
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

  final String time;

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
                    color: purple,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    time,
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
                    color: purple,
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
  const _RoadInformation({Key? key}) : super(key: key);

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
            Column(
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
                  '480 Nguyễn Thị Minh Khai',
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
    );
  }
}

class _EstimateCards extends StatelessWidget {
  const _EstimateCards({Key? key}) : super(key: key);

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
                    '17:30',
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
                    '15 phút',
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
            cursorColor: purple,
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
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  final Color colorLine;

  DashedLineVerticalPainter(this.colorLine);

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 6, dashSpace = 1, startY = 0;
    final paint = Paint()
      ..color = colorLine
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
