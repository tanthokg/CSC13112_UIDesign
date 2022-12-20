import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniride/constants/colors.dart';

class PickTripTimeView extends StatefulWidget {
  const PickTripTimeView({Key? key}) : super(key: key);

  @override
  State<PickTripTimeView> createState() => _PickTripTimeViewState();
}

class _PickTripTimeViewState extends State<PickTripTimeView> {
  String _pickedDate = 'Ngày xuất phát';
  String _startDate = 'Ngày bắt đầu';
  String _endDate = 'Ngày kết thúc';
  TimeOfDay? _pickedTime;

  String _chosenPeriodType = 'Mỗi ngày';
  final _chosenWeekdays = [false, false, false, false, false, false, false];

  bool _isOnce = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chọn thời gian'),
        centerTitle: true,
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Giờ xuất phát',
              style: TextStyle(fontSize: 18, color: blackBlue),
            ),
            const SizedBox(height: 16),
            Material(
              borderRadius: BorderRadius.circular(24),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              color: Colors.white,
              shadowColor: Colors.grey[200],
              child: InkWell(
                onTap: () async {
                  final result = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
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
                    Expanded(
                      child: Text(
                        _pickedTime == null ? 'Thời gian' : _pickedTime!.format(context),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: _pickedTime == null ? FontWeight.w300 : FontWeight.w400,
                          color: _pickedTime == null ? blackBlue.shade300 : blackBlue.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 56)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Ngày xuất phát',
              style: TextStyle(fontSize: 18, color: blackBlue),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: _isOnce ? blueSky.shade100 : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isOnce = true;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.today_rounded, color: blueSky),
                        const SizedBox(width: 8),
                        const Text(
                          'Một lần',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: _isOnce == false ? blueSky.shade100 : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isOnce = false;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.repeat_rounded, color: blueSky),
                        const SizedBox(width: 8),
                        const Text(
                          'Định kỳ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            _isOnce
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Loại định kỳ',
                      style: TextStyle(fontSize: 18, color: blackBlue),
                    ),
                  ),
            !_isOnce
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              backgroundColor: _chosenPeriodType == 'Mỗi ngày' ? blueSky.shade100 : Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _chosenPeriodType = 'Mỗi ngày';
                              });
                            },
                            child: const Text(
                              'Mỗi ngày',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              backgroundColor: _chosenPeriodType == 'Mỗi tuần' ? blueSky.shade100 : Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _chosenPeriodType = 'Mỗi tuần';
                              });
                            },
                            child: const Text(
                              'Mỗi tuần',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              backgroundColor: _chosenPeriodType == 'Mỗi tháng' ? blueSky.shade100 : Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _chosenPeriodType = 'Mỗi tháng';
                              });
                            },
                            child: const Text(
                              'Mỗi tháng',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            !_isOnce && _chosenPeriodType == 'Mỗi tuần'
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Chọn ngày trong tuần',
                      style: TextStyle(fontSize: 18, color: blackBlue),
                    ),
                  )
                : const SizedBox.shrink(),
            _isOnce || (!_isOnce && (_chosenPeriodType == 'Mỗi ngày' || _chosenPeriodType == 'Mỗi tháng'))
                ? Material(
                    borderRadius: BorderRadius.circular(24),
                    elevation: 3.0,
                    clipBehavior: Clip.hardEdge,
                    color: Colors.white,
                    shadowColor: Colors.grey[200],
                    child: InkWell(
                      onTap: () async {
                        final result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        setState(() {
                          if (result != null) {
                            _pickedDate = DateFormat('dd/MM/yyyy').format(result);
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                            child: Icon(
                              Icons.calendar_month_rounded,
                              color: blueSky,
                              size: 28,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _pickedDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _pickedDate == 'Ngày xuất phát' ? FontWeight.w300 : FontWeight.w400,
                                color: _pickedDate == 'Ngày xuất phát' ? blackBlue.shade300 : blackBlue.shade600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 56)
                        ],
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List<Widget>.generate(
                      7,
                      (index) => TextButton(
                        style: TextButton.styleFrom(
                          shape: CircleBorder(
                              side: BorderSide(color: _chosenWeekdays[index] ? blueSky.shade200 : blueSky.shade600)),
                          minimumSize: Size.zero,
                          backgroundColor: _chosenWeekdays[index] ? blueSky.shade200 : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _chosenWeekdays[index] = !_chosenWeekdays[index];
                          });
                        },
                        child: Text(weekdayShorts[index]),
                      ),
                    ),
                  ),
            !_isOnce
                ? Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      'Chỗ này ghi gì',
                      style: TextStyle(fontSize: 18, color: blackBlue),
                    ),
                  )
                : const SizedBox.shrink(),
            !_isOnce
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      elevation: 3.0,
                      clipBehavior: Clip.hardEdge,
                      color: Colors.white,
                      shadowColor: Colors.grey[200],
                      child: InkWell(
                        onTap: () async {
                          final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          setState(() {
                            if (result != null) {
                              _startDate = DateFormat('dd/MM/yyyy').format(result);
                            }
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                              child: Icon(
                                Icons.start,
                                color: blueSky,
                                size: 28,
                              ),
                            ),
                            Text(
                              _startDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _startDate == 'Ngày bắt đầu' ? FontWeight.w300 : FontWeight.w400,
                                color: _startDate == 'Ngày bắt đầu' ? blackBlue.shade300 : blackBlue.shade600,
                              ),
                            ),
                            const SizedBox(width: 56)
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            !_isOnce
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      elevation: 3.0,
                      clipBehavior: Clip.hardEdge,
                      color: Colors.white,
                      shadowColor: Colors.grey[200],
                      child: InkWell(
                        onTap: () async {
                          final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          setState(() {
                            if (result != null) {
                              _endDate = DateFormat('dd/MM/yyyy').format(result);
                            }
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.start,
                                  color: blueSky,
                                  size: 28,
                                ),
                              ),
                            ),
                            Text(
                              _endDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _endDate == 'Ngày kết thúc' ? FontWeight.w300 : FontWeight.w400,
                                color: _endDate == 'Ngày kết thúc' ? blackBlue.shade300 : blackBlue.shade600,
                              ),
                            ),
                            const SizedBox(width: 56)
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 48),
            TextButton(
              onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}

const periodTypes = ['Mỗi ngày', 'Mỗi tuần', 'Mỗi tháng'];
const weekdays = ['Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy', 'Chủ nhật'];
const weekdayShorts = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
