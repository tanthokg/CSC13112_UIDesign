import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

import '../../constants/routes.dart';
import '../../database/user_dao.dart';
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
        backgroundColor: Colors.purple.shade100,
        appBar: AppBar(
          title: const Text('Hoàn tất chuyến xe'),
          centerTitle: true,
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24),),
            borderSide: BorderSide.none,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      // Thông tin người lái xe
                      Row(
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar/avatar-01.png',),
                            radius: 32,
                          ),
                          SizedBox(width: 16,),
                          Text(
                            'Nguyễn Văn A',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      // Thông tin tuyến đường đi của người đi nhờ
                      Column(
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
                      Divider(
                        color: Colors.grey.shade300,
                      ),

                      // Thông tin tuyến đường đi của người lái xe
                      Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
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
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: CustomPaint(
                                size: const Size(1, 16),
                                painter: DashedLineVerticalPainter(blueSky[900]!),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
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
                      Divider(
                        color: Colors.grey.shade300,
                      ),

                      // Thời gian, giá tiền của chuyến xe
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today_rounded, color: purple,),
                                const SizedBox(width: 8,),
                                Text(
                                  '13/11/2022 - 17:40',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),

                            Row(
                              children: [
                                Icon(Icons.motorcycle_rounded, color: purple,),
                                const SizedBox(width: 8,),
                                Text(
                                  '4.5 km',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),

                            Row(
                              children: [
                                Icon(Icons.access_time_rounded, color: purple,),
                                const SizedBox(width: 8,),
                                Text(
                                  '17:40 - 17:55',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Giá tiền',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18,),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.rating);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purple),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(56),),
                ),
                child: const Text(
                  'Đánh giá',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              
              const SizedBox(height: 16,),
              
              OutlinedButton(
                onPressed: () async {
                  /*final user = await UserDAO.instance.readUserByEmail(email);
                  if (mounted) {
                    Navigator.pushReplacementNamed(context, Routes.home,
                        arguments: {'name': user!.name});
                  }*/
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                    color: purple,
                    width: 2,
                  ),),
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(purple),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(56),),
                ),
                child: const Text(
                  'Đánh giá sau',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

