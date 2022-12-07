import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uniride/constants/colors.dart';

class IncomingCallView extends StatefulWidget {
  const IncomingCallView({Key? key}) : super(key: key);

  @override
  State<IncomingCallView> createState() => _IncomingCallViewState();
}

class _IncomingCallViewState extends State<IncomingCallView> {
  bool isAccept = false;
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Cuộc gọi đến',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: blackBlue),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/pantone.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 90,
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(width: 2, color: blackBlue)),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage('assets/logo/facebook.png'),
                  maxRadius: 80,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Nguyễn Văn A",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: blackBlue,
                    fontFamily: 'Inter',
                  )),
              Text("Người lái xe",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: blackBlue.shade400,
                  )),
              const SizedBox(
                height: 70,
              ),
              Container(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        child: IconButton(
                            onPressed: () {},
                            iconSize: 36,
                            icon: Icon(Icons.mic_off, color: blackBlue))),
                    SizedBox(width: 24),
                    Container(
                        child: IconButton(
                            onPressed: () {},
                            iconSize: 36,
                            icon: Icon(Icons.volume_up, color: blackBlue))),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(32)),
                              padding: const EdgeInsets.all(8),
                              child: IconButton(
                                  onPressed: () {
                                    if (isAccept)
                                      isFinished = true;
                                    else
                                      Navigator.pop(context);
                                  },
                                  iconSize: 32,
                                  icon: const Icon(Icons.call_end,
                                      color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            isAccept
                                ? const Text(
                                    'Kết thúc',
                                  )
                                : const Text('Từ chối'),
                          ],
                        ),
                      ),
                      isAccept
                          ? SizedBox.shrink()
                          : Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(60, 158, 158, 158),
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    padding: const EdgeInsets.all(6),
                                    child: IconButton(
                                        onPressed: () {},
                                        iconSize: 20,
                                        icon: const Icon(Icons.message,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Tin nhắn',
                                  )
                                ],
                              ),
                            ),
                      isAccept
                          ? SizedBox.shrink()
                          : Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    padding: const EdgeInsets.all(8),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isAccept = true;
                                          });
                                        },
                                        iconSize: 32,
                                        icon: const Icon(Icons.call_rounded,
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text(
                                    'Chấp nhận',
                                  )
                                ],
                              ),
                            ),
                    ],
                  ))
            ],
          )),
    ));
  }
}
