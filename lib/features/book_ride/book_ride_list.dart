import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/map/simple_map.dart';
import 'package:uniride/features/ride_track/waiting_rider.dart';

class BookRideListView extends StatefulWidget {
  const BookRideListView({Key? key}) : super(key: key);

  @override
  State<BookRideListView> createState() => _BookRideListViewState();
}

class _BookRideListViewState extends State<BookRideListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tìm chuyến xe'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            const SimpleMapView(),
            Column(
              children: [
                const BookerRoadInformationCard(),
                const Spacer(),
                SizedBox(
                  height: 453,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext lContext, int index) {
                        return const RiderRoadInformationCard();
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
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

class BookerRoadInformationCard extends StatelessWidget {
  const BookerRoadInformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: 4,
      surfaceTintColor: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
            child: Row(
              children: [
                Icon(
                  Icons.radio_button_on_rounded,
                  color: purple[900],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Điểm đón khách',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const Text(
                      '480 Nguyễn Thị Minh Khai',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomPaint(
                size: const Size(1, 16),
                painter: DashedLineVerticalPainter(purple[900]!),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12.0, bottom: 12.0, right: 12.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: purple[900],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Điểm trả khách',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const Text(
                      '311 Nguyễn Thượng Hiền',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RiderRoadInformationCard extends StatefulWidget {
  const RiderRoadInformationCard({Key? key}) : super(key: key);

  @override
  State<RiderRoadInformationCard> createState() =>
      _RiderRoadInformationCardState();
}

class _RiderRoadInformationCardState extends State<RiderRoadInformationCard> {
  var isBook = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        margin: const EdgeInsets.all(24),
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        child: Column(
          children: [
            Card(
              color: Colors.blue[100]?.withAlpha(75),
              margin:
                  const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 8),
              elevation: 0,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/avatar/avatar-01.png',
                      ),
                      radius: 24,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nguyễn Văn A',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '28/11/2022',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '13:20 - 13:40',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 8.0, right: 24.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.radio_button_on_rounded,
                        color: blueSky[900],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ĐH. Khoa học Tự nhiên',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '227 NVC, Phường 4, Quận 5',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: CustomPaint(
                      size: const Size(1, 16),
                      painter: DashedLineVerticalPainter(blueSky[900]!),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: blueSky[900],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '410 Nguyễn Đình Chiểu',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Phường 4, Quận 3',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                color: Colors.grey[200],
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Giá tiền',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const Text(
                        '5,000đ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Thời gian',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const Text(
                        '~20 phút',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
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
                      child: const Text('Đặt xe'),
                    ),
            ),
          ],
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
