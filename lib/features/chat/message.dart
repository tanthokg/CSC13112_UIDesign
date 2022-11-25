import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class Message extends StatelessWidget {
  const Message(
      {Key? key, required this.messageContent, required this.messageType})
      : super(key: key);
  final String messageContent;
  final String messageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
      child: Align(
        alignment: (messageType == "receiver"
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (messageType == "receiver"
                ? Colors.grey.shade200
                : blueSky[300]),
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            messageContent,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
