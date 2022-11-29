import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/book_ride/book_ride_list.dart';
import 'package:uniride/features/create_trip/created_trip.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  bool _earlyDepart = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text('Tạo chuyến xe'),
          centerTitle: true,
          elevation: 2,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.grey[50],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                surfaceTintColor: Colors.white,
                shadowColor: Colors.grey[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Thông tin chuyến xe',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: blackBlue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 32,
                            backgroundImage:
                                AssetImage('assets/avatar/avatar-01.png'),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Người lái xe',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: blackBlue.shade400),
                              ),
                              Text(
                                'Nguyễn Văn A',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: blackBlue),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 8, 48, 0),
                      child: Row(
                        children: [
                          Icon(Icons.radio_button_on_rounded, color: blueSky),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'KTX khu B, ĐHQG-HCM',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 4, horizontal: 60),
                        child: CustomPaint(
                          size: const Size(1, 16),
                          painter: DashedLineVerticalPainter(blueSky),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 0, 48, 8),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: blueSky),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              '227 Nguyễn Văn Cừ, P4, Q5',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ĐIỀU CHỈNH TUYẾN ĐƯỜNG',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Divider(color: blueSky.shade300),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Material(
                              borderRadius: BorderRadius.circular(24),
                              elevation: 3,
                              clipBehavior: Clip.hardEdge,
                              shadowColor: Colors.grey[200],
                              child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[400],
                                  ),
                                  hintText: 'Ngày xuất phát',
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 16, right: 12),
                                    child: Icon(Icons.date_range_rounded,
                                        color: blueSky, size: 28),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: Material(
                              borderRadius: BorderRadius.circular(24),
                              elevation: 3.0,
                              clipBehavior: Clip.hardEdge,
                              shadowColor: Colors.grey[200],
                              child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[400],
                                  ),
                                  hintText: 'Thời gian',
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 16, right: 12),
                                    child: Icon(Icons.access_time_rounded,
                                        color: blueSky, size: 28),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Material(
                        borderRadius: BorderRadius.circular(24),
                        elevation: 3.0,
                        clipBehavior: Clip.hardEdge,
                        shadowColor: Colors.grey[200],
                        child: TextField(
                          autocorrect: false,
                          minLines: 3,
                          maxLines: 5,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[400],
                            ),
                            hintText: 'Mô tả',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: blueSky,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            value: _earlyDepart,
                            onChanged: (value) {
                              setState(() {
                                _earlyDepart = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Khởi hành trước 10 phút',
                              style: TextStyle(fontSize: 18, color: blackBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Divider(color: blueSky.shade300),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.motorcycle_rounded,
                                    size: 32,
                                    color: blueSky,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    '5.0 km',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.timer_outlined,
                                      size: 32, color: blueSky),
                                  const SizedBox(width: 16),
                                  Text(
                                    '~40 phút',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Giá tiền',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: blackBlue),
                            ),
                            Text(
                              '14,000đ',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: blackBlue),
                            )
                          ],
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatedTrip(
                            departureText: 'KTX khu B, ĐHQG-HCM',
                            destinationText: '227 Nguyễn Văn Cừ, P4, Q5',
                            additionalDescription: '',
                          ),
                        ));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: blueSky,
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: const Text(
                    'Xác nhận',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
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
