import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/cancel_trip/cancel_dialog.dart';

class CancelTripView extends StatefulWidget {
  const CancelTripView({Key? key}) : super(key: key);

  @override
  State<CancelTripView> createState() => _CancelTripViewState();
}

class _CancelTripViewState extends State<CancelTripView> {
  var radioList = [
    "Người lái xe không phản hồi",
    "Tôi không thích người lái xe",
    "Thay đổi thời gian đặt xe",
    "Thay đổi điểm đón/trả",
    "Không đi nữa",
    "Lý do khác"
  ];
  String radioValue = 'default';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 2,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey[50],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        title: const Text(
          "Hủy chuyến xe",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Vui lòng cho chúng tôi biết lý do",
                          style: TextStyle(
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: radioList.length,
                        itemBuilder: (BuildContext lContext, int index) {
                          return RadioListTile(
                            title: Text(
                              radioList[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            value: radioList[index],
                            groupValue: radioValue,
                            onChanged: (String? value) {
                              setState(
                                () {
                                  radioValue = value!;
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(24),
                          elevation: 3.0,
                          clipBehavior: Clip.hardEdge,
                          shadowColor: Colors.grey[200],
                          child: TextField(
                            autocorrect: false,
                            minLines: 3,
                            maxLines: 5,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[400],
                              ),
                              hintText: 'Mô tả lý do hủy chuyến',
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext builder) =>
                                    const CancelDialog());
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: red,
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: const Text(
                            'Hủy chuyến xe',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            )),
      )),
    ));
  }
}
