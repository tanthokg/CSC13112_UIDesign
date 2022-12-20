import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/routes.dart';
import '../book_ride/book_ride_list.dart';

class ResultHitchhikerLocationView extends StatefulWidget {
  const ResultHitchhikerLocationView({Key? key}) : super(key: key);

  @override
  State<ResultHitchhikerLocationView> createState() =>
      _ResultHitchhikerLocationViewState();
}

class _ResultHitchhikerLocationViewState
    extends State<ResultHitchhikerLocationView> {
  var results = {
    0: ['Nguyễn Thị B', '7,000đ', '17:30, 19/11/2022'],
    1: ['Lê Văn C', '8,000đ', '12:30, 19/11/2022'],
    2: ['Quế Bạch D', '5,000đ', '17:30, 20/11/2022'],
    3: ['Nguyễn Thị B', '17,000đ', '10:00, 20/11/2022'],
  };

  @override
  Widget build(BuildContext context) {
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
              const _HitchhikerLocation(),
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
                      text: '3',
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
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return _RoadInformation(ride: results[index]!,);
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
  const _RoadInformation({Key? key, required this.ride}) : super(key: key);

  final List<String> ride;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.rideList, arguments: {
          'information': ride
        });
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
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Chuyến đi xe đồng hành cùng '),
                        TextSpan(
                          text: ride[0],
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
                  Text(
                    ride[2],
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
              ride[1],
              style: TextStyle(
                color: blackBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
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
  }) : super(key: key);

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
                  Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
    );
  }
}
