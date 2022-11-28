import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar/avatar-01.png',),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.grey.shade400,
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 16,),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tạo chuyến xe thành công',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: blackBlue,
                ),
              ),
              const SizedBox(height: 4,),
              Text(
                'Bạn sẽ nhận được thông báo sớm nhất khi có người gửi yêu cầu đồng hành.',
                style: TextStyle(
                  fontSize: 16,
                  color: blackBlue,
                ),
              ),
              const SizedBox(height: 4,),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '1 ngày trước',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
            ],
          ),
        ),
      ],
    );
  }
}
