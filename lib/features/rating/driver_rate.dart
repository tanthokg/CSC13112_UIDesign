import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uniride/constants/routes.dart';

import '../../constants/colors.dart';

class DriverRateView extends StatefulWidget {
  const DriverRateView({Key? key}) : super(key: key);

  @override
  State<DriverRateView> createState() => _DriverRateViewState();
}

class _DriverRateViewState extends State<DriverRateView> {
  Widget firstTitle = const Text(
    'Thông tin người đi nhờ xe',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  Widget secondTitle = const Text(
    'Chấm điểm người đi nhờ xe',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  Widget thirdTitle = const Text(
    'Nhận xét chi tiết',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  Widget fourthTitle = const Text(
    'Lời nhắn của bạn',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đánh giá chuyến xe'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            //Navigator.popUntil(context, ModalRoute.withName(Routes.home));
            Navigator.pushNamed(context, Routes.homepage);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            firstTitle,
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromRGBO(236, 245, 255, 1),
              ),
              height: 80,
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/avatar/avatar-01.png',
                      ),
                      radius: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Huynh Van Khong',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: const Text(
                          '(5,0)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            secondTitle,
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 50,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            thirdTitle,
            const SizedBox(
              height: 12,
            ),
            Wrap(spacing: 8, runSpacing: 8, children: [
              FilterChip(
                label: const Text('Đúng giờ'),
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: const Text('Chạy cẩn thận'),
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: const Text('Vui vẻ'),
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: const Text('Lịch sự'),
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: const Text('Xe đẹp'),
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: const Text('Có nón sẵn'),
                onSelected: (bool value) {},
              ),
            ]),
            const SizedBox(
              height: 18,
            ),
            fourthTitle,
            const SizedBox(
              height: 12,
            ),
            Column(
              children: const <Widget>[
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      minLines:
                          6, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhắn nhủ của bạn đến người đi cùng',
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(blueSky),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize:
                    MaterialStateProperty.all(const Size.fromHeight(56)),
              ),
              child: const Text(
                'Gửi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
