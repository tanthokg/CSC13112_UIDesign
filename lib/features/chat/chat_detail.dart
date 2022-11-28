import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/chat/message.dart';

class ChatDetailView extends StatefulWidget {
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  String name = '';
  List<Message> messages = [
    const Message(
        messageContent: "Chào bạn, mình muốn đi nhờ xe", messageType: "sender"),
    const Message(messageContent: "Ok bạn nha", messageType: "receiver"),
    const Message(
        messageContent: "Như vậy tóm lại ngày mai bạn đón mình ở đâu nhỉ",
        messageType: "sender"),
    const Message(
        messageContent: "Bạn đứng ở cổng trước KTX khu B giúp mình nha",
        messageType: "receiver"),
    const Message(messageContent: "Dèee", messageType: "sender"),
    const Message(messageContent: "Bạn ơi cho mình hỏi", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    name = args != null ? args.toString() : 'Chat Detail';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(name),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Message(
                      messageContent: messages[index].messageContent,
                      messageType: messages[index].messageType);
                }),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.camera_alt_sharp,
                          color: blueSky,
                          size: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.image,
                          color: blueSky,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Nhập tin nhắn",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          focusElevation: 0,
                          hoverElevation: 0,
                          elevation: 0,
                          onPressed: () {},
                          child: Icon(
                            Icons.send,
                            color: blueSky,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
