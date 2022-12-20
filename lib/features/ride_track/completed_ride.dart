import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uniride/constants/colors.dart';

import '../book_ride/book_ride_list.dart';

class CompletedRideView extends StatefulWidget {
  const CompletedRideView({Key? key}) : super(key: key);

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
            children: const [
              // Thông tin của người lái xe
              _RiderInformation(),
              SizedBox(
                height: 18,
              ),

              // Thông tin tuyến đường đi của người đi nhờ
              _RoadHitchhikerInformation(),
              SizedBox(
                height: 12,
              ),

              // Thời gian, giá tiền của chuyến xe
              _TimeInformation(),

              _RatingRider(),
              SizedBox(
                height: 18,
              ),

              _RatingButtons(),
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
            //Navigator.pushNamed(context, Routes.rating);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(purple),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(
              const Size.fromHeight(56),
            ),
          ),
          child: const Text(
            'Đánh giá',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        OutlinedButton(
          onPressed: () {},
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
  const _RatingRider({Key? key}) : super(key: key);

  @override
  State<_RatingRider> createState() => _RatingRiderState();
}

class _RatingRiderState extends State<_RatingRider> {
  var detailRatingText = <String>[
    'Đúng giờ',
    'Chạy cẩn thận',
    'Vui vẻ',
    'Lịch sự',
    'Xe đẹp',
    'Có nón sẵn'
  ];
  var tipText = <String>['0đ', '5,000đ', '10,000đ', '15,000đ', '20,000đ'];

  var detailRating = <bool>[false, false, false, false, false, false];
  int? selectedTipIndex;
  var tipForRider = <bool>[false, false, false, false, false];

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
              'Bạn cảm thấy chuyến xe với Đỗ Gia Hưng thế nào?',
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
                  maxLines: 5,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            // Tiền bo cho người lái xe
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
                    setState(() {
                      selectedTipIndex = index;
                    });
                  },
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
  }) : super(key: key);

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
                    '17:31, 19/11/2022',
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
                    '17:36 - 17:51',
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
    );
  }
}

class _RoadHitchhikerInformation extends StatelessWidget {
  const _RoadHitchhikerInformation({
    Key? key,
  }) : super(key: key);

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
                      size: const Size(1, 32),
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
                      height: 32,
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
                      size: const Size(1, 32),
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
                      Column(
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
                            'Cách điểm đón 5 phút',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blackBlue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '17: 31',
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
                      Text(
                        '17: 36',
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
                      Text(
                        '17: 51',
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
                      Column(
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

class _RiderInformation extends StatelessWidget {
  const _RiderInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueSkySwatch[900]?.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/avatar/avatar-01.png',
            ),
            radius: 32,
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đỗ Gia Hưng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackBlue,
                ),
              ),
              Text(
                'Yamaha Sirius, 59B-192.12',
                style: TextStyle(
                  color: blackBlue.shade400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                '(4.8)',
                style: TextStyle(
                  color: blackBlue.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
