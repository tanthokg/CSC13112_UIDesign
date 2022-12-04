import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

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
          body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 6,
                    width: 64,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Hủy chuyến xe",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, height: 1.5),
                ),
                SizedBox(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Vui lòng cho chúng tôi biết lý do",
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: radioList.length,
                        itemBuilder: (BuildContext lContext, int index) {
                          return RadioListTile(
                            title: Text(radioList[index]),
                            value: radioList[index],
                            groupValue: radioValue,
                            onChanged: (String? value) {
                              setState(() {
                                radioValue = value!;
                              });
                            },
                          );
                        }),
                  ],
                )),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          autocorrect: true,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          minLines: 4,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[400],
                            ),
                            hintText: 'Mô tả lý do hủy chuyến',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          onPressed: () {},
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
    );
  }
}
