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
      content: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              img,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: blackBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blackBlue.shade400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
