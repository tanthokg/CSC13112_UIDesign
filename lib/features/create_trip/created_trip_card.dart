import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniride/constants/colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:uniride/database/trip_dao.dart';

import '../../constants/routes.dart';
import '../../entity/trip.dart';
import '../../widget/customer_pick_up_destination_card.dart';

class CreatedTripCard extends StatefulWidget {
  const CreatedTripCard({
    Key? key,
    required this.trip,
    required this.updateCallback,
  }) : super(key: key);

  final Trip trip;
  final void Function()? updateCallback;

  @override
  State<CreatedTripCard> createState() => _CreatedTripCardState();
}

class _CreatedTripCardState extends State<CreatedTripCard> {
  @override
  void initState() {
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: _statusBackgroundColor(
                        widget.trip.status.toLowerCase()),
                  ),
                  child: Text(
                    widget.trip.status.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  timeago.format(
                    widget.trip.createdTime,
                    locale: 'vi',
                  ),
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),

            // TODO: information of hitchhiker
            // Code here
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.trip.hitchhiker.isEmpty ? Colors.grey.shade300 : const Color.fromARGB(255, 245, 230, 248),
              ),
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO: column of avatar and (label) + name
                  // Code here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // TODO: the real avatar
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundImage: widget.trip.hitchhiker.isEmpty ? null : const AssetImage(
                              'assets/avatar/avatar-01.png',
                            ),
                            radius: 24,
                          ),
                        ),
                      ),

                      // empty space
                      const SizedBox(
                        width: 16,
                      ),

                      // TODO: column of label and name
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nguời đi nhờ xe',
                          ),
                          Text(
                            widget.trip.hitchhiker,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // TODO: column of rating
                  widget.trip.hitchhiker.isEmpty ? Container() : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      const Text(
                        '(5,0)',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // TODO: Pick-up and drop point
            // Code here
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // column of icons
                  Container(
                    width: 25,
                    height: 110,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.radio_button_on, color: purple),
                        Container(
                          height: 48,
                          margin: const EdgeInsets.only(left: 9),
                          child: DottedLine(
                            direction: Axis.vertical,
                            lineLength: 48,
                            lineThickness: 1.5,
                            dashLength: 4.0,
                            dashColor: purple,
                            dashGapLength: 1.5,
                          ),
                        ),
                        Icon(Icons.location_on_outlined, color: purple),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // pick up
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Điểm đón khách',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '480 Nguyễn Thị Minh Khai',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blackBlue,
                            ),
                          ),
                        ],
                      ),
                      // destination
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Điểm trả khách',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '311 Nguyễn Thượng Hiền',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.grey.shade300,
              thickness: 2,
            ),

            // TODO: Departure and destination point
            // Code here
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // column of icons
                  Container(
                    width: 25,
                    height: 110,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.radio_button_on, color: blueSky),
                          Container(
                              height: 48,
                              margin: const EdgeInsets.only(left: 9),
                              child: DottedLine(
                                direction: Axis.vertical,
                                lineLength: 48,
                                lineThickness: 1.5,
                                dashLength: 4.0,
                                dashColor: blueSky,
                                dashGapLength: 1.5,
                              )),
                          Icon(Icons.location_on_outlined, color: blueSky),
                        ]),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // departure
                      const Text(
                        'Điểm đón khách',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.trip.departure,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // pick up
                      const SizedBox(height: 24),
                      // destination

                      const Text(
                        'Điểm trả khách',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.trip.dest,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.grey.shade300,
              thickness: 2,
            ),
            const SizedBox(
              height: 4,
            ),

            // TODO: Start time, distance, moving time
            // Code here
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(236, 245, 255, 1),
              ),
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: blueSky),
                      const SizedBox(width: 5),
                      const Text(
                        '13/11/2022 - 17:30',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.motorcycle_sharp, color: blueSky),
                      const SizedBox(width: 5),
                      Text(
                        '${widget.trip.distance} km',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.timer_sharp, color: blueSky),
                      const SizedBox(width: 5),
                      Text(
                        '~${(widget.trip.distance * 5).floor()} phút',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            // TODO: Price
            // Code here
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Giá tiền',
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                      Text('${NumberFormat('#,##0', 'en_US').format(widget.trip.price)}đ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ]),
              ],
            ),
            const SizedBox(
              height: 18,
            ),

            Buttons(
              trip: widget.trip,
              updateCallback: widget.updateCallback,
            ),
          ],
        ),
      ),
    );
  }

  Color _statusBackgroundColor(String status) {
    if (status == 'còn trống') {
      return Colors.grey;
    }
    if (status == 'đang đợi bạn phản hồi') {
      return const Color(0xff9DD1BB);
    }
    if (status == 'đã nhận') {
      return blueSky;
    }
    if (status == 'đã huỷ') {
      return red;
    }
    if (status == 'đang chở') {
      return purple;
    }
    if (status == 'hoàn thành') {
      return Colors.greenAccent;
    }
    return Colors.grey;
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.trip, required this.updateCallback})
      : super(key: key);

  final Trip trip;
  final void Function()? updateCallback;

  @override
  Widget build(BuildContext context) {
    if (trip.status.toLowerCase() == 'còn trống') {
      return Row(
        children: const [
          Expanded(
            child: OutlinedButton(
              onPressed: null,
              onLongPress: null,
              child: Text('Đang đợi xác nhận ...'),
            ),
          ),
        ],
      );
    }

    if (trip.status.toLowerCase() == 'đang đợi bạn phản hồi') {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () async {
                await TripDAO.instance.updateTrip(
                  trip.clone(
                    status: 'Còn trống',
                    hitchhiker: '',
                  ),
                );
                updateCallback;
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: red,
                side: BorderSide(
                  color: red,
                ),
              ),
              child: const Text('Huỷ'),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                await TripDAO.instance.updateTrip(
                  trip.clone(status: 'Đã nhận'),
                );
                updateCallback;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueSky,
                foregroundColor: Colors.white,
              ),
              child: const Text('Xác nhận'),
            ),
          ),
        ],
      );
    }

    if (trip.status.toLowerCase() == 'đã nhận') {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.driverReadyToStart);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueSky,
                foregroundColor: Colors.white,
              ),
              child: const Text('Bắt đầu chuyến xe'),
            ),
          ),
        ],
      );
    }

    if (trip.status.toLowerCase() == 'đã huỷ') {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: blueSky,
                side: BorderSide(
                  color: blueSky,
                ),
              ),
              child: const Text('Hỗ trợ'),
            ),
          ),
        ],
      );
    }

    if (trip.status.toLowerCase() == 'đang chở') {
      return Column(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.currentLocation);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: blueSky,
                side: BorderSide(
                  color: blueSky,
                ),
              ),
              child: const Text('Xem bản đồ'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.driverEnd);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueSky,
                foregroundColor: Colors.white,
              ),
              child: const Text('Kết thúc chuyến xe'),
            ),
          ),
        ],
      );
    }

    if (trip.status.toLowerCase() == 'hoàn thành') {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.driverRating);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueSky,
                foregroundColor: Colors.white,
              ),
              child: const Text('Đánh giá nguời đi xe'),
            ),
          ),
        ],
      );
    }

    return Container();
  }
}
