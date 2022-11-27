import 'dart:js_util';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/auth/drivers_list_routes.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({Key? key}) : super(key: key);

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  String departureText = "";
  String destinationText = "";
  String additionalDescription = "";

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: background,
            appBar: AppBar(
                title: Center(
                    child: Text("Tạo chuyến xe",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            body: Container(
                child: Column(children: [
              SizedBox(height: 24),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(children: [
                    Text('Thông tin chuyến xe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter')),
                    SizedBox(height: 24),
                    TextField(
                      onChanged: (newString) {
                        departureText = newString;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          labelText: "Vị trí đi",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      onChanged: (newString) {
                        destinationText = newString;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          labelText: "Vị trí đến",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    SizedBox(height: 12),
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                      ElevatedButton(
                          child: Text("Bấm vô đây để chọn ngày"),
                          onPressed: () async {
                            DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025));
                          })
                    ]),
                    SizedBox(height: 12),
                    TextField(
                      onChanged: (newString) {
                        additionalDescription = newString;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 10),
                          labelText: "Mô tả",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    SizedBox(height: 12),
                    Divider(),
                    Row(
                      children: [
                        Column(children: [
                          Row(mainAxisSize: MainAxisSize.max, children: [
                            Text('Độ dài quãng đường',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(width: 20),
                            Text('5km', style: TextStyle(fontSize: 16))
                          ]),
                          SizedBox(height: 12),
                          Row(mainAxisSize: MainAxisSize.max, children: [
                            Text('Thời gian ước tính',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(width: 20),
                            Text('20 phút', style: TextStyle(fontSize: 16))
                          ])
                        ]),
                        Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Giá tiền',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            Text(
                              '7,000đ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  fontSize: 32),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(children: [
                      Checkbox(
                          value: false,
                          onChanged: (val) {
                            setState(() {
                              isChecked = val!;
                              if (val == true) {
                                //
                              }
                            });
                          }),
                      Text('Tạo theo định kỳ')
                    ])
                  ])),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DriversListRoute(
                                            departureText: departureText,
                                            destinationText: destinationText,
                                            additionalDescription:
                                                additionalDescription)));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: blueSky,
                                minimumSize: const Size.fromHeight(56),
                              ),
                              child: const Text('Tạo chuyến xe',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))))))
            ]))));
  }
}
