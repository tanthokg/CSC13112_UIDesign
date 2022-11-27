import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';

class DriversListRoute extends StatefulWidget {
  final String departureText;
  final String destinationText;
  final String additionalDescription;

  const DriversListRoute(
      {Key? key,
      required this.departureText,
      required this.destinationText,
      required this.additionalDescription})
      : super(key: key);

  @override
  State<DriversListRoute> createState() => _DriversListRouteState();
}

class _DriversListRouteState extends State<DriversListRoute> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Center(child: Text("Danh sách chuyến xe của tôi"))),
            body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.all(24),
                          child: Container(
                            alignment: Alignment.center,
                            color: Color(0xECF5FF),
                            child: Row(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                      radius: 32,
                                      backgroundImage: AssetImage(
                                          'assets/avatar/avatar-01.png')),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Người lái xe',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: blackBlue.shade300,
                                        ),
                                      ),
                                      Text(
                                        'Nguyễn Văn A',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: blackBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Text('Vị trí đi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 20),
                        Text(widget.departureText,
                            style: TextStyle(fontSize: 16)),
                        Expanded(child: SizedBox()),
                        Container(
                            alignment: Alignment.topRight,
                            child: Text('Trạng thái: Mới tạo',
                                style: TextStyle(fontWeight: FontWeight.w200)))
                      ]),
                      SizedBox(height: 12),
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Text('Vị trí đến',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 20),
                        Text(widget.destinationText,
                            style: TextStyle(fontSize: 16))
                      ]),
                      SizedBox(height: 12),
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Text('Thời gian',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 20),
                        Text('24/11/2022', style: TextStyle(fontSize: 16))
                      ]),
                      SizedBox(height: 12),
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Text('Mô tả',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 20),
                        Text(widget.additionalDescription,
                            style: TextStyle(fontSize: 16))
                      ]),
                    ]),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7)
                        ]),
                  ),
                  SizedBox(height: 12)
                ]))));
  }
}
