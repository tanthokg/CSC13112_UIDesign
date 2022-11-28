import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/forgot_password.dart';
import 'package:uniride/features/auth/create_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _riderRole = true;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 3.0,
                  surfaceTintColor: Colors.white,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Image.asset(
                          _riderRole
                              ? 'assets/illustration/role_rider.png'
                              : 'assets/illustration/role_booker.png',
                          width: 240,
                          height: 240,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 200,
                          height: 48,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: blueSky.shade50,
                                    borderRadius: BorderRadius.circular(32)),
                              ),
                              _riderRole
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          setState(() {
                                            _riderRole = !_riderRole;
                                          });
                                        },
                                        child: Container(
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: blueSky.shade100,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: blueSky.shade50,
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  //offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                        ),
                                      ),
                                    )
                                  : Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          setState(() {
                                            _riderRole = !_riderRole;
                                          });
                                        },
                                        child: Container(
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: purple.shade100,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: purple.shade50,
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  //offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(32)),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Bạn đang chọn',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: blackBlue.shade200,
                          ),
                        ),
                        Text(
                          _riderRole ? 'Người lái xe' : 'Người đặt xe',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: blackBlue,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            _riderRole
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateRoute()))
                                : Navigator.pushNamed(context, Routes.rideList);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: _riderRole ? blueSky : purple,
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: Text(
                            _riderRole ? 'Tạo chuyến xe' : 'Tìm chuyến xe',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tính năng nổi bật',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: blackBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Các tính năng được nhiều người\nsử dụng trong vòng 1 tháng!',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackBlue.shade200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/illustration/top_features.png',
                      width: 80,
                      height: 80,
                    )
                  ],
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/create_trip.png',
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _riderRole ? 'Tạo chuyến xe' : 'Tạo cuộc hẹn',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: blackBlue,
                            ),
                          ),
                          Text(
                            _riderRole
                                ? 'Tạo thông tin chuyến xe để\nthực hiện dịch vụ đi xe'
                                : 'Tạo cuộc hẹn để đồng hành\ncùng người lái xe ',
                            style: TextStyle(
                              fontSize: 14,
                              color: blackBlue.shade300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/find_trip.png',
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _riderRole ? 'Xác nhận chuyến xe' : 'Tìm chuyến xe',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: blackBlue,
                            ),
                          ),
                          Text(
                            _riderRole
                                ? 'Xem và phê duyệt các\nyêu cầu đặt xe'
                                : 'Tìm các chuyến xe để\nđi đến vị trí mong muốn',
                            style: TextStyle(
                              fontSize: 14,
                              color: blackBlue.shade300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/open_map.png',
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xem bản đồ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: blackBlue,
                            ),
                          ),
                          Text(
                            'Tìm kiếm địa điểm\ntrên bản đồ',
                            style: TextStyle(
                              fontSize: 14,
                              color: blackBlue.shade300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Tính năng khác',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: blackBlue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Image.asset(
                              'assets/icon/wallet.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            'Liên kết\nví điện tử',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: blackBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32),
                    Column(
                      children: [
                        Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Image.asset(
                              'assets/icon/chat.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            'Trò chuyện\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: blackBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Phát triển bởi nhóm HCMUS UniRide\n© All rights reserved',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: blackBlue.shade300,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
