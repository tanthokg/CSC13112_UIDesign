import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uniride/constants/routes.dart';

class BookerRatingView extends StatefulWidget {
  const BookerRatingView({Key? key}) : super(key: key);

  @override
  State<BookerRatingView> createState() => _BookerRatingViweState();
}

class _BookerRatingViweState extends State<BookerRatingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text('Đánh giá chuyến xe'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thông tin người lái xe
                const Text(
                  'Thông tin người lái xe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/avatar/avatar-01.png',
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Đỗ Gia Hưng',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: blackBlue,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellowAccent.shade400,
                            ),
                            Text(
                              '(5.0)',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),

                // Chm điểm người lái xe
                Text(
                  'Chấm điểm người lái xe',
                  style: TextStyle(
                    color: blackBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                Center(
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
                    onRatingUpdate: (double value) {},
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),

                // Nhận xét chi tiết
                Text(
                  'Nhận xét chi tiết',
                  style: TextStyle(
                    color: blackBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
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

                // Lời nhắn của bạn
                Text(
                  'Lời nhắn của bạn',
                  style: TextStyle(
                    color: blackBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                  height: 18,
                ),

                // Tiền bo cho người lái xe
                Text(
                  'Tiền bo cho người lái xe',
                  style: TextStyle(
                    color: blackBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                Wrap(spacing: 8, runSpacing: 8, children: [
                  FilterChip(
                    label: const Text('5,000đ'),
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: const Text('10,000đ'),
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: const Text('20,000đ'),
                    onSelected: (bool value) {},
                  ),
                ]),
                const SizedBox(
                  height: 18,
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false,);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(purple),
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
        ),
      ),
    );
  }
}
