import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.img,
      required this.title,
      required this.content});
  final String img;
  final String title;
  final String content;

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
        height: 320,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              // 'assets/illustration/green_checked.png',
              img,
              width: 120,
              height: 120,
            ),
            Column(
              children: [
                Text(
                  // 'Người lái đã đến vị trí đón',
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    //  'Chuyến xe của bạn sẽ được bắt đầu ngay bây giờ',
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(122, 89, 89, 90),
                      fontSize: 18,
                    )),
                const SizedBox(
                  height: 10,
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
                    'OK!',
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
