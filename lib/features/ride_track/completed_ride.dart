import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/entity/trip.dart';
import 'package:uniride/widget/driver_information.dart';

import '../../widget/dash_line_vertical.dart';

class CompletedRideView extends StatefulWidget {
  const CompletedRideView({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  State<CompletedRideView> createState() => _CompletedRideViewState();
}

class _CompletedRideViewState extends State<CompletedRideView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hoàn tất chuyến xe'),
          centerTitle: true,
          elevation: 3,
          surfaceTintColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Thông tin của người lái xe
              DriverInformation(
                nameOfDriver: widget.trip.rider,
              ),
              const SizedBox(
                height: 18,
              ),

              // Thông tin tuyến đường đi của người đi nhờ
              _RoadHitchhikerInformation(
                trip: widget.trip,
              ),
              const SizedBox(
                height: 12,
              ),

              // Thời gian, giá tiền của chuyến xe
              _TimeInformation(
                trip: widget.trip,
              ),

              _RatingRider(
                trip: widget.trip,
              ),
              const SizedBox(
                height: 18,
              ),

              const _RatingButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingButtons extends StatelessWidget {
  const _RatingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
                  (route) => false,
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(purple),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(
              const Size.fromHeight(56),
            ),
          ),
          child: const Text(
            'Gửi đánh giá',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                color: purple,
                width: 2,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all(purple),
            minimumSize: MaterialStateProperty.all(
              const Size.fromHeight(56),
            ),
          ),
          child: const Text(
            'Đánh giá sau',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class _RatingRider extends StatefulWidget {
  const _RatingRider({Key? key, required this.trip}) : super(key: key);
  final Trip trip;

  @override
  State<_RatingRider> createState() => _RatingRiderState();
}

class _RatingRiderState extends State<_RatingRider> {
  var detailRatingText = <String>['Đúng giờ', 'Chạy cẩn thận', 'Vui vẻ', 'Lịch sự', 'Xe đẹp', 'Có nón sẵn'];
  var tipText = <String>['5,000đ', '10,000đ', '15,000đ', '20,000đ'];

  var detailRating = <bool>[false, false, false, false, false, false];
  int? selectedTipIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Đánh giá chuyến xe',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bạn cảm thấy chuyến xe với ${widget.trip.rider} thế nào?',
              style: TextStyle(
                color: blackBlue.shade400,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 32,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (double value) {},
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Một số nhận xét về người lái xe',
              style: TextStyle(
                color: blackBlue.shade400,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: List<Widget>.generate(
                detailRatingText.length,
                (index) => FilterChip(
                  label: Text(
                    detailRatingText[index],
                    style: TextStyle(
                      color: blackBlue,
                      fontSize: 16,
                    ),
                  ),
                  selected: detailRating[index],
                  selectedColor: purple.shade400,
                  onSelected: (selected) {
                    setState(() {
                      detailRating[index] = selected;
                    });
                  },
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: blackBlue.shade300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            // Lời nhắn của bạn
            Text(
              'Lời nhắn của bạn',
              style: TextStyle(
                color: blackBlue.shade400,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            Material(
              elevation: 2,
              shadowColor: Colors.grey.shade400,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nhắn nhủ của bạn đến người lái xe',
                    hintStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Tiền bo cho người lái xe',
              style: TextStyle(
                color: blackBlue.shade400,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: List<Widget>.generate(
                tipText.length,
                (index) => InputChip(
                  selectedColor: purple.shade400,
                  label: Text(
                    tipText[index],
                    style: TextStyle(
                      color: blackBlue,
                      fontSize: 16,
                    ),
                  ),
                  selected: selectedTipIndex == index,
                  onSelected: (selected) {
                    if (selectedTipIndex == index) {
                      setState(() {
                        selectedTipIndex = null;
                      });
                    } else {
                      setState(() {
                        selectedTipIndex = index;
                      });
                    }
                  },
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: blackBlue.shade300,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TimeInformation extends StatelessWidget {
  const _TimeInformation({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final Trip trip;

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
                    '${trip.startTime.hour}:${trip.startTime.minute}, ${trip.startTime.day}/${trip.startTime.month}/${trip.startTime.year}',
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
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: purple,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${trip.pickTime?.hour}:${trip.pickTime?.minute} - ${trip.dropTime?.hour}:${trip.dropTime?.minute}',
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
                  '${NumberFormat('#,##0').format(trip.price)}đ',
                  style: TextStyle(
                    color: blackBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoadHitchhikerInformation extends StatelessWidget {
  const _RoadHitchhikerInformation({
    Key? key,
    required this.trip,
  }) : super(key: key);

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
          children: [
            Column(
              children: [
                Icon(
                  Icons.radio_button_on_rounded,
                  color: blueSky[900],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomPaint(
                      size: const Size(1, 40),
                      painter: DashedLineVerticalPainter(blueSky[900]!),
                    ),
                  ),
                ),
                Icon(
                  Icons.radio_button_on_rounded,
                  color: purple[900],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        width: 2,
                        color: purple[900],
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.location_on,
                  color: purple[900],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomPaint(
                      size: const Size(1, 40),
                      painter: DashedLineVerticalPainter(blueSky[900]!),
                    ),
                  ),
                ),
                Icon(
                  Icons.location_on,
                  color: blueSky[900],
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
                              'Vị trí đi',
                              style: TextStyle(
                                color: blackBlue.shade400,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Cách điểm đón ${(trip.pickTime?.difference(trip.startTime))?.inMinutes ?? 0} phút',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blackBlue,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${(trip.startTime.hour)}:${(trip.startTime.minute)}',
                        style: TextStyle(
                          color: blackBlue,
                          fontSize: 16,
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
                              'Điểm đón khách',
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
                          ],
                        ),
                      ),
                      Text(
                        '${(trip.pickTime?.hour)}:${(trip.pickTime?.minute)}',
                        style: TextStyle(
                          color: blackBlue,
                          fontSize: 16,
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
                      Text(
                        '${(trip.dropTime?.hour)}:${(trip.dropTime?.minute)}',
                        style: TextStyle(
                          color: blackBlue,
                          fontSize: 16,
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
                              'Vị trí đến',
                              style: TextStyle(
                                color: blackBlue.shade400,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Text(''),
                    ],
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
