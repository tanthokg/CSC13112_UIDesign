import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/book_ride/book_ride_list.dart';
import 'package:uniride/features/create_trip/created_trip.dart';
import 'package:uniride/features/create_trip/list_created_trip.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  String _pickedDate = 'Ngày xuất phát';
  TimeOfDay? _pickedTime;
  String _periodType = periodTypes.first;
  bool _earlyDepart = false;
  String _earlyDepartTime = earlyDepartTimes.first;
  final List<bool> _chosenWeekdays = [false, false, false, false, false, false, false];

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    final createOnce = await chooseDateQuery(context);
                    if (createOnce && mounted) {
                      final picked = await chooseStartDate(context);
                      setState(() {
                        _pickedDate = picked.toString().substring(0, 10);
                      });
                    } else {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Chọn loại định kỳ'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Thoát')),
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                          ],
                          content: DropdownButtonFormField<String>(
                            value: _periodType,
                            items: periodTypes
                                .map((type) => DropdownMenuItem<String>(value: type, child: Text(type)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _periodType = value!;
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: blueSky,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                              filled: true,
                              fillColor: blueSky.shade100,
                              enabledBorder: transBorder24,
                              focusedBorder: transBorder24,
                            ),
                          ),
                        ),
                      );
                      switch (_periodType) {
                        case 'Mỗi ngày':
                          setState(() {
                            _pickedDate = 'Mỗi ngày';
                          });
                          break;
                        case 'Mỗi tuần':
                          await showDialog(
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text('Chọn ngày trong tuần'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Thoát')),
                                    TextButton(
                                        onPressed: () {
                                          _pickedDate = 'T';
                                          if (_chosenWeekdays[0]) {
                                            _pickedDate += '2, ';
                                          }
                                          if (_chosenWeekdays[1]) {
                                            _pickedDate += '3, ';
                                          }
                                          if (_chosenWeekdays[2]) {
                                            _pickedDate += '4, ';
                                          }
                                          if (_chosenWeekdays[3]) {
                                            _pickedDate += '5, ';
                                          }
                                          if (_chosenWeekdays[4]) {
                                            _pickedDate += '6, ';
                                          }
                                          if (_chosenWeekdays[5]) {
                                            _pickedDate += '7, ';
                                          }
                                          if (_chosenWeekdays[6]) {
                                            _pickedDate += 'CN';
                                          }
                                          setState(() {
                                            if (_pickedDate.endsWith(' ')) {
                                              _pickedDate = _pickedDate.substring(0, _pickedDate.length - 2);
                                            }
                                            if (_chosenWeekdays.where((choice) => choice == true).length == 7) {
                                              _pickedDate = 'Mỗi ngày';
                                            }
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK')),
                                  ],
                                  content: SizedBox(
                                    height: 336,
                                    width: 180,
                                    child: ListView.builder(
                                      itemCount: 7,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Checkbox(
                                              activeColor: blueSky,
                                              fillColor: MaterialStateProperty.all(blueSky),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                              value: _chosenWeekdays[index],
                                              onChanged: (value) {
                                                setState(() {
                                                  _chosenWeekdays[index] = value!;
                                                });
                                              },
                                            ),
                                            Text(
                                              weekdays[index],
                                              style: TextStyle(fontSize: 18, color: blueSky),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                          setState(() {});
                          break;
                        case 'Mỗi tháng':
                          if (mounted) {
                            final result = await chooseStartDate(context);
                            setState(() {
                              _pickedDate = 'Ngày ${result.toString().substring(8, 10)} hằng tháng';
                            });
                          }
                          break;
                        default:
                          setState(() {
                            _pickedDate = 'không rõ';
                          });
                          break;
                      }
                    }
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
                        _pickedDate,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: _pickedDate == 'Ngày xuất phát' ? FontWeight.w300 : FontWeight.w400,
                          color: _pickedDate == 'Ngày xuất phát' ? blackBlue.shade300 : blackBlue.shade600,
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
              child: Material(
                borderRadius: BorderRadius.circular(24),
                elevation: 3.0,
                clipBehavior: Clip.hardEdge,
                color: Colors.white,
                shadowColor: Colors.grey[200],
                child: InkWell(
                  onTap: () async {
                    final result = await chooseStartTime(context);
                    setState(() {
                      _pickedTime = result;
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                        child: Icon(
                          Icons.access_time_rounded,
                          color: blueSky,
                          size: 28,
                        ),
                      ),
                      Text(
                        _pickedTime == null ? 'Thời gian' : _pickedTime!.format(context),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: _pickedTime == null ? FontWeight.w300 : FontWeight.w400,
                          color: _pickedTime == null ? blackBlue.shade300 : blackBlue.shade600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_note_rounded,
                    size: 40,
                    color: blueSky,
                  ),
                ),
              ),
            ),
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
                          Icon(Icons.timer_outlined, size: 32, color: blueSky),
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: blackBlue),
                    ),
                    Text(
                      '14,000đ',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: blackBlue),
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

Future<String> chooseDatePeriod(BuildContext context) async {
  return '';
}

Future<DateTime?> chooseStartDate(BuildContext context) async => await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

Future<TimeOfDay?> chooseStartTime(BuildContext context) async => await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

const earlyDepartTimes = ['10 phút', '15 phút', '20 phút', '30 phút'];
const periodTypes = ['Mỗi ngày', 'Mỗi tuần', 'Mỗi tháng'];
const weekdays = ['Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy', 'Chủ nhật'];

const transBorder24 = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.all(Radius.circular(24)),
);
