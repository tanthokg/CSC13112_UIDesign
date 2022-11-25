import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniride/features/notification/custom_dialog.dart';

class DialogView extends StatefulWidget {
  const DialogView({super.key});

  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<DialogView> {
  String jsonData =
      '[{"title":"Người lái đã đến vị trí đón!","img" : "assets/illustration/green_checked.png", "content":"Chuyến xe của bạn sẽ được bắt đầu ngay bây giờ"}, {"title":"Chuyến xe đã kết thúc!","img" : "assets/illustration/green_checked.png", "content":"Hãy đánh giá chuyến xe và đóng góp ý kiến cho ứng dụng nhé"}]';

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = jsonDecode(jsonData);

    return Scaffold(
      appBar: AppBar(title: const Text('Demo Dialog')),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                      img: data[index]['img'],
                      title: data[index]['title'],
                      content: data[index]['content'])),
              child: Text(data[index]['title']),
            );
          },
        ),
      ),
    );
  }
}
