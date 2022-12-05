import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/cancel_trip/cancel_success_dialog.dart';

class CancelDialog extends StatelessWidget {
  const CancelDialog({
    super.key,
  });
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
        height: 420,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/illustration/confirm_cancel.png',
              width: 180,
              height: 180,
            ),
            Column(
              children: [
                const Text(
                  'Hủy chuyến xe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Bạn có chắc chắn muốn hủy chuyến xe này không',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(122, 89, 89, 90),
                      fontSize: 18,
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                    showDialog(
                        context: context,
                        builder: (BuildContext builder) =>
                            const CancelSuccessDialog());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: blueSky,
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: const Text(
                    'Xác nhận hủy chuyến',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(56),
                    side: const BorderSide(width: 2, color: Color(0xFF3E96FF)),
                  ),
                  child: const Text(
                    'Quay lại',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3E96FF),
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
