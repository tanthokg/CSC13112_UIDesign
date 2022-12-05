import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class CancelSuccessDialog extends StatelessWidget {
  const CancelSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
          alignment: Alignment.topRight,
          child: TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Icon(
                Icons.clear,
                color: Color.fromARGB(122, 89, 89, 90),
                size: 24,
              ))),
      content: Container(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/illustration/green_checked.png',
              width: 120,
              height: 120,
            ),
            Column(
              children: [
                const Text(
                  'Hủy chuyến xe thành công',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: blueSky,
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: const Text(
                    'Về trang chủ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
