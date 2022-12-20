import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/book_ride/book_ride_list.dart';
import 'package:uniride/features/create_trip/created_trip.dart';
import 'package:uniride/features/create_trip/list_created_trip.dart';
import 'package:uniride/features/create_trip/pick_trip_time.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  String _pickedMoment = 'Chọn thời gian';
  bool _noteToggle = false;
  bool _earlyDepart = false;
  String _earlyDepartTime = earlyDepartTimes.first;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tạo chuyến xe'),
        centerTitle: true,
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                ),
                child: Image.asset('assets/images/trip-path.jpg')),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(Icons.radio_button_on_rounded, color: blueSky),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      data['src'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: blueGray,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 36),
                child: CustomPaint(
                  size: const Size(1, 32),
                  painter: DashedLineVerticalPainter(blueSky),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 16),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined, color: blueSky),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      data['dest'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: blueGray,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text(
                'ĐIỀU CHỈNH TUYẾN ĐƯỜNG',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Divider(color: blueSky.shade300),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Material(
                borderRadius: BorderRadius.circular(24),
                elevation: 3,
                clipBehavior: Clip.hardEdge,
                color: Colors.white,
                shadowColor: Colors.grey[200],
                child: InkWell(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PickTripTimeView(),
                      ),
                    );
                    setState(() {
                      _pickedMoment = result;
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                        child: Icon(
                          Icons.date_range_rounded,
                          color: blueSky,
                          size: 28,
                        ),
                      ),
                      Text(
                        _pickedMoment,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: _pickedMoment == 'Chọn thời gian' ? FontWeight.w300 : FontWeight.w400,
                          color: _pickedMoment == 'Chọn thời gian' ? blackBlue.shade300 : blackBlue.shade600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: _noteToggle ? blueSky : Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _noteToggle = !_noteToggle;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_note_rounded,
                        color: _noteToggle ? Colors.white : blueSky,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Thêm lời nhắn',
                        style: TextStyle(fontSize: 16, color: _noteToggle ? Colors.white : blueSky),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _noteToggle
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      elevation: 3.0,
                      clipBehavior: Clip.hardEdge,
                      shadowColor: Colors.grey[200],
                      child: TextField(
                        autocorrect: false,
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: blackBlue.shade400,
                          ),
                          hintText: 'Lời nhắn',
                          enabledBorder: transBorder24,
                          focusedBorder: transBorder24,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: blueSky,
                    fillColor: MaterialStateProperty.all(blueSky),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    value: _earlyDepart,
                    onChanged: (value) {
                      setState(() {
                        _earlyDepart = value!;
                      });
                    },
                  ),
                  Tooltip(
                    message: 'Tự động hủy chuyến xe nếu không có người đặt\ntrong khoảng thời gian trước giờ khởi hành',
                    showDuration: const Duration(seconds: 5),
                    triggerMode: TooltipTriggerMode.tap,
                    child: Text(
                      'Khách phải đặt trước',
                      style: TextStyle(fontSize: 16, color: blueSky),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    //width: 122,
                    child: DropdownButtonFormField<String>(
                      value: _earlyDepartTime,
                      items: earlyDepartTimes
                          .map((time) => DropdownMenuItem<String>(value: time, child: Text(time)))
                          .toList(),
                      onChanged: _earlyDepart
                          ? (value) {
                              setState(() {
                                _earlyDepartTime = value!;
                              });
                            }
                          : null,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: _earlyDepart ? blueSky : Colors.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        filled: true,
                        fillColor: _earlyDepart ? blueSky.shade100 : Colors.grey[200],
                        enabledBorder: transBorder24,
                        focusedBorder: transBorder24,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              child: Divider(color: blueSky.shade300),
            ),
            Row(
              children: [
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.motorcycle_rounded, size: 28, color: blueSky),
                          const SizedBox(width: 16),
                          Text(
                            '5.0 km',
                            style: TextStyle(
                              fontSize: 18,
                              color: blueGray,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined, size: 28, color: blueSky),
                          const SizedBox(width: 16),
                          Text(
                            '~40 phút',
                            style: TextStyle(
                              fontSize: 18,
                              color: blueGray,
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
                        fontWeight: FontWeight.w400,
                        color: blackBlue,
                      ),
                    ),
                    Text(
                      '14,000đ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: blackBlue,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListCreatedTripView(),
                      ));
                },
                style: TextButton.styleFrom(
                  backgroundColor: blueSky,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text(
                  'Xác nhận',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> chooseDateQuery(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chọn ngày xuất phát'),
        content: const Text('Bạn muốn tạo chuyến một lần hay tạo chuyến định kỳ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Định kỳ'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Một lần'),
          )
        ],
      ),
    ).then((value) => value ?? false);

const earlyDepartTimes = ['10 phút', '15 phút', '20 phút', '30 phút'];

const transBorder24 = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.all(Radius.circular(24)),
);
