import 'package:flutter/material.dart';
import 'package:uniride/features/chat/chat_tile.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatState();
}

class _ChatState extends State<ChatView> {
  List<ChatTile> chatTiles = [
    const ChatTile(
        name: "Vương Ðức Tuệ",
        messageText: "Bạn ơi cho mình hỏi",
        imageURL:
            "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/7/16/1069162/BTS-Jimin-8B.jpg",
        time: "Bây giờ"),
    const ChatTile(
        name: "Bá Quang Vinh",
        messageText: "Bạn có thể cho mình xin fb đc ko",
        imageURL:
            "https://thethaovanhoa.mediacdn.vn/Upload/QDN4HPIpMrJuoPNyIvLDA/files/2022/04/Jimin-BTS-media14.jpg",
        time: "Hôm qua"),
    const ChatTile(
        name: "Công Thanh Minh",
        messageText: "Chào bạn, mình muốn đi nhờ xe",
        imageURL:
            "https://static2.yan.vn/YanNews/2167221/201812/201812040926131c0a-36a21416.jpg",
        time: "31/03/2022"),
    const ChatTile(
        name: "Phù Thiếu Anh",
        messageText: "Bạn đợi mình 15p nữa nha",
        imageURL:
            "https://photo-3-baomoi.zadn.vn/w700_r1/2020_01_31_329_33808535/288aa8b690f579ab20e4.jpg",
        time: "28/03/2022"),
    const ChatTile(
        name: "Cát Uyên Thy",
        messageText: "Ok bạn nha",
        imageURL:
            "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/7/16/1069162/BTS-Jimin-8B.jpg",
        time: "23/03/2022"),
    const ChatTile(
        name: "Doãn Diễm Chi",
        messageText: "Bạn có tạo chuyến xe này cố định kh",
        imageURL:
            "https://thethaovanhoa.mediacdn.vn/Upload/PQgc44ci4D5b7WtAo06jg/files/2022/01/anh3(45).jpeg",
        time: "17/03/2022"),
    const ChatTile(
        name: "Lương Cảnh Tuấn",
        messageText: "Mình gửi sđt liên lạc ne",
        imageURL:
            "https://photo-3-baomoi.zadn.vn/w700_r1/2020_01_31_329_33808535/288aa8b690f579ab20e4.jpg",
        time: "24/02/2022"),
    const ChatTile(
        name: "Khu Xuân Vũ",
        messageText: "Chiều nay mình qua đón sớm 1 xíu nha",
        imageURL:
            "https://static2.yan.vn/YanNews/2167221/201812/201812040926131c0a-36a21416.jpg",
        time: "18/02/2022"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Trò chuyện'),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            itemCount: chatTiles.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatTile(
                name: chatTiles[index].name,
                messageText: chatTiles[index].messageText,
                imageURL: chatTiles[index].imageURL,
                time: chatTiles[index].time,
              );
            },
          ),
        ),
      ),
    );
  }
}
