import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:uniride/database/trip_dao.dart';

import '../../entity/trip.dart';

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
            const SizedBox(
              height: 18,
            ),

            // TODO: Pick-up and drop point
            // Code here
            const SizedBox(
              height: 12,
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 2,
            ),
            const SizedBox(
              height: 12,
            ),

            // TODO: Departure and destination point
            // Code here
            const SizedBox(
              height: 12,
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 2,
            ),
            const SizedBox(
              height: 12,
            ),

            // TODO: Start time, distance, moving time
            // Code here
            const SizedBox(
              height: 12,
            ),

            // TODO: Price
            // Code here
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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
