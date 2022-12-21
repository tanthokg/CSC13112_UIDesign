import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uniride/constants/colors.dart';

import '../../constants/status.dart';

class CreatedTripListView extends StatefulWidget {
  const CreatedTripListView({Key? key}) : super(key: key);

  @override
  State<CreatedTripListView> createState() => _CreatedTripListViewState();
}

class _CreatedTripListViewState extends State<CreatedTripListView> {
  DateTime? _selectedDateTime;
  DateTime _focusedDate = DateTime.now();

  final status = <String>[
    'Còn trống',
    'Đợi phản hồi',
    'Đã nhận',
    'Đã huỷ',
    'Đang chở',
    'Hoàn thành'
  ];
  int? selectedStatusIndex;
  StatusRide? selectedStatusFilter;
  final createdList = {
    0: {
      'avatar': 'assets/avatar/avatar-02.jpg',
      'name': 'Nguyễn Văn A',
      'content': ' đang chờ phản hồi chuyến đi lái xe cùng bạn.',
      'date': DateTime(2022, 11, 19, 12, 30),
      'price': '7,000đ',
      'new': true,
      'status': StatusRide.waiting
    },
    1: {
      'avatar': 'assets/avatar/default-avatar.png',
      'name': '',
      'content': 'Chuyến đi lái xe chưa tìm được người đi cùng.',
      'date': DateTime(2022, 11, 18, 16, 30),
      'price': '7,000đ',
      'new': true,
      'status': StatusRide.empty
    },
    2: {
      'avatar': 'assets/avatar/default-avatar.png',
      'name': '',
      'content': 'Chuyến đi lái xe chưa tìm được người đi cùng.',
      'date': DateTime(2022, 11, 18, 10, 00),
      'price': '7,000đ',
      'new': false,
      'status': StatusRide.empty
    },
  };
  Map<int, Map<String, dynamic>> filteredTrip = {};

  @override
  Widget build(BuildContext context) {
    filteredTrip.clear();
    createdList.forEach((key, value) {
      var compareDay =
          (value['date'] as DateTime).year == _selectedDateTime?.year &&
              (value['date'] as DateTime).month == _selectedDateTime?.month &&
              (value['date'] as DateTime).day == _selectedDateTime?.day;
      if (selectedStatusFilter == null && compareDay) {
        filteredTrip[filteredTrip.length] = value;
      }
      else if (value['status'] == selectedStatusFilter && compareDay) {
        filteredTrip[filteredTrip.length] = value;
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Danh sách chuyến xe'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TableCalendar(
                focusedDay: _focusedDate,
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDateTime, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDateTime, selectedDay)) {
                    setState(() {
                      _selectedDateTime = selectedDay;
                      _focusedDate = focusedDay;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDate = focusedDay;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: status.length,
                  itemBuilder: (context, index) {
                    return InputChip(
                      label: Text(status[index]),
                      selected: selectedStatusIndex == index,
                      onSelected: (value) {
                        setState(() {
                          selectedStatusIndex = index;
                          selectedStatusFilter = StatusRide.values[index];
                        });
                      },
                      onDeleted: () {
                        setState(() {
                          selectedStatusIndex = null;
                          selectedStatusFilter = null;
                        });
                      },
                      selectedColor: purple.shade100,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              // DON'T REMOVE CONTAINER HERE
              Container(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _CardInformation(
                      trip: filteredTrip[index]!,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: filteredTrip.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardInformation extends StatelessWidget {
  const _CardInformation({Key? key, required this.trip}) : super(key: key);

  final Map<String, dynamic> trip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(trip['avatar']),
          radius: 32,
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: trip['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: trip['content'],
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16,
                    color: blackBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${(trip['date'] as DateTime).hour}:${(trip['date'] as DateTime).minute}, ${(trip['date'] as DateTime).day}/${(trip['date'] as DateTime).month}/${(trip['date'] as DateTime).year}',
                style: TextStyle(color: blackBlue.shade400, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          trip['price'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Icon(
          Icons.circle,
          size: 12,
          color: trip['new'] ? blueSky : Colors.grey,
        ),
      ],
    );
  }
}
