import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/widget/dash_line_vertical.dart';

class DetailCreatedTripView extends StatefulWidget {
  const DetailCreatedTripView({Key? key}) : super(key: key);

  @override
  State<DetailCreatedTripView> createState() => _DetailCreatedTripViewState();
}

class _DetailCreatedTripViewState extends State<DetailCreatedTripView> {
  var isRiderRoleSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chuyến xe'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.white,
          elevation: 3,
          actions: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Mã chuyến xe: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blackBlue,
                      ),
                    ),
                    TextSpan(
                      text: 'ABCDEF123456',
                      style: TextStyle(
                        color: blackBlue.shade400,
                      ),
                    ),
                  ],
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12,),

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
                            backgroundImage:
                                AssetImage('assets/avatar/avatar-02.jpg'),
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
                            backgroundImage:
                                AssetImage('assets/avatar/default-avatar.png'),
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
              //Image.asset('assets/images/empty_trip.png'),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Xem bản đồ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),

              // Chip information
              Row(
                children: [
                  Expanded(flex: 2, child: Container()),
                  FilterChip(
                    label: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      height: 32,
                      width: 100,
                      child: const Center(
                        child: Text(
                          'Lái xe',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    selected: isRiderRoleSelected,
                    selectedColor: blueSky.shade100,
                    onSelected: (value) {
                      setState(() {
                        isRiderRoleSelected = true;
                      });
                    },
                    showCheckmark: false,
                    shape: const StadiumBorder(
                      side: BorderSide.none,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  FilterChip(
                    label: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      height: 32,
                      width: 100,
                      child: const Center(
                        child: Text(
                          'Đi nhờ xe',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    selected: !isRiderRoleSelected,
                    onSelected: (value) {
                      setState(() {
                        isRiderRoleSelected = false;
                      });
                    },
                    selectedColor: purple.shade100,
                    showCheckmark: false,
                    shape: const StadiumBorder(
                      side: BorderSide.none,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: CustomPaint(
                                size: const Size(1, 32),
                                painter:
                                    DashedLineVerticalPainter(purple[900]!),
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
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),

              // Time of trip
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
                              '19/11/2022 - 17:35',
                              style: TextStyle(
                                color: blackBlue,
                                fontSize: 16,
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
                height: 18,
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Đánh giá dành cho bạn',
                        style: TextStyle(
                          fontSize: 16,
                          color: blackBlue,
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
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Icon(
                        FontAwesomeIcons.coins,
                        color: purple,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        '7,000đ',
                        style: TextStyle(
                          fontSize: 16,
                          color: blackBlue,
                        ),
                      ),
                      const Spacer(),
                      RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 32,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                        ignoreGestures: true,
                        unratedColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 3,
                    surfaceTintColor: Colors.white,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        hintText: 'Chạy đúng giờ, lịch sự, thân thiện',
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),

              Column(
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
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
