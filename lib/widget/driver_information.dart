import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DriverInformation extends StatelessWidget {
  const DriverInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueSkySwatch[900]?.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/avatar/avatar-01.png',
            ),
            radius: 32,
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đỗ Gia Hưng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackBlue,
                ),
              ),
              Text(
                'Yamaha Sirius, 59B-192.12',
                style: TextStyle(
                  color: blackBlue.shade400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                '(4.8)',
                style: TextStyle(
                  color: blackBlue.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
