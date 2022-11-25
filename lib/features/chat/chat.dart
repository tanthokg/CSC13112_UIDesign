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
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL:
            "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/7/16/1069162/BTS-Jimin-8B.jpg",
        time: "Now"),
    const ChatTile(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL:
            "https://thethaovanhoa.mediacdn.vn/Upload/QDN4HPIpMrJuoPNyIvLDA/files/2022/04/Jimin-BTS-media14.jpg",
        time: "Yesterday"),
    const ChatTile(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL:
            "https://static2.yan.vn/YanNews/2167221/201812/201812040926131c0a-36a21416.jpg",
        time: "31 Mar"),
    const ChatTile(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL:
            "https://photo-3-baomoi.zadn.vn/w700_r1/2020_01_31_329_33808535/288aa8b690f579ab20e4.jpg",
        time: "28 Mar"),
    const ChatTile(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL:
            "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/7/16/1069162/BTS-Jimin-8B.jpg",
        time: "23 Mar"),
    const ChatTile(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL:
            "https://thethaovanhoa.mediacdn.vn/Upload/PQgc44ci4D5b7WtAo06jg/files/2022/01/anh3(45).jpeg",
        time: "17 Mar"),
    const ChatTile(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL:
            "https://photo-3-baomoi.zadn.vn/w700_r1/2020_01_31_329_33808535/288aa8b690f579ab20e4.jpg",
        time: "24 Feb"),
    const ChatTile(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://static2.yan.vn/YanNews/2167221/201812/201812040926131c0a-36a21416.jpg",
        time: "18 Feb"),
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
