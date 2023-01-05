import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniride/constants/status.dart';
import 'package:uniride/entity/trip.dart';

import '../../constants/colors.dart';
import '../../constants/routes.dart';
import '../../widget/dash_line_vertical.dart';

class ResultHitchhikerLocationView extends StatefulWidget {
  const ResultHitchhikerLocationView({Key? key}) : super(key: key);

  @override
  State<ResultHitchhikerLocationView> createState() =>
      _ResultHitchhikerLocationViewState();
}

class _ResultHitchhikerLocationViewState
    extends State<ResultHitchhikerLocationView> {
  final trip = <Trip>[
    Trip(
        rider: 'Nguyễn Thị B',
        hitchhiker: '',
        createdTime: DateTime(2023, 01, 8, 10, 30),
        startTime: DateTime(2023, 01, 09, 17, 30),
        departure: '',
        dest: '',
        price: 5000,
        distance: 5,
        status: TripStatus.empty),
    Trip(
        rider: 'Lê Văn C',
        hitchhiker: '',
        createdTime: DateTime(2023, 01, 8, 8),
        startTime: DateTime(2023, 01, 10, 12, 30),
        departure: '',
        dest: '',
        price: 8000,
        distance: 8,
        status: TripStatus.empty),
    Trip(
        rider: 'Quế Bạch D',
        hitchhiker: '',
        createdTime: DateTime(2023, 01, 09, 12, 30),
        startTime: DateTime(2023, 01, 10, 17, 30),
        departure: '',
        dest: '',
        price: 5000,
        distance: 5,
        status: TripStatus.empty),
    Trip(
        rider: 'Nguyễn Thị B',
        hitchhiker: '',
        createdTime: DateTime(2023, 01, 09, 18, 30),
        startTime: DateTime(2023, 01, 11, 8, 30),
        departure: '',
        dest: '',
        price: 15000,
        distance: 15,
        status: TripStatus.empty),
  ];

  @override
  Widget build(BuildContext context) {
    final departureAndDestTrip =
        ModalRoute.of(context)?.settings.arguments as Map;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tìm kiếm chuyến xe'),
          surfaceTintColor: purple.shade100,
          centerTitle: true,
          elevation: 3,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HitchhikerLocation(
                departureAndDest: departureAndDestTrip,
              ),
              const SizedBox(
                height: 18,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 18,
              ),

              // Kết quả tìm kiếm
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Hiển thị ',
                    ),
                    TextSpan(
                      text: trip.length.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blackBlue,
                      ),
                    ),
                    const TextSpan(
                      text: ' kết quả phù hợp',
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 18,
                    color: blackBlue.shade400,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),

              // DON'T REMOVE CONTAINER HERE
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: trip.length,
                  itemBuilder: (context, index) {
                    final detailTrip = trip[index].clone(
                      pickTime:
                          trip[index].startTime.add(const Duration(minutes: 5)),
                      pickupPoint: departureAndDestTrip['src'],
                      dropTime: trip[index].startTime.add(Duration(
                          minutes: (trip[index].distance * 3 + 5).toInt())),
                      dropPoint: departureAndDestTrip['dest'],
                    );
                    return _RoadInformation(
                      trip: detailTrip,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoadInformation extends StatelessWidget {
  const _RoadInformation({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.rideList,
            arguments: {'information': trip});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: const Border(),
                borderRadius: BorderRadius.circular(48),
                color: purple.shade100,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.motorcycle_rounded,
                color: purple,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Chuyến đi xe đồng hành cùng '),
                        TextSpan(
                          text: trip.rider,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 18,
                        color: blackBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    '${trip.startTime.hour}:${trip.startTime.minute}, ${trip.startTime.day}/${trip.startTime.month}/${trip.startTime.year}',
                    style: TextStyle(
                      color: blackBlue.shade400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              '${NumberFormat('#,##0').format(trip.price)}đ',
              style: TextStyle(
                color: blackBlue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HitchhikerLocation extends StatelessWidget {
  const _HitchhikerLocation({
    Key? key,
    required this.departureAndDest,
  }) : super(key: key);

  final Map departureAndDest;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Điểm đón khách',
                          style: TextStyle(
                            color: blackBlue.shade400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          departureAndDest['src'] ?? '',
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
              const SizedBox(
                height: 18,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Điểm trả khách',
                          style: TextStyle(
                            color: blackBlue.shade400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          departureAndDest['dest'] ?? '',
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
          ),
        ),
      ],
    );
  }
}
