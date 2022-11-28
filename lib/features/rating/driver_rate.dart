import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/colors.dart';

class DriverRateView extends StatefulWidget {
  const DriverRateView({Key? key}) : super(key: key);

  @override
  State<DriverRateView> createState() => _DriverRateViewState();
}

class _DriverRateViewState extends State<DriverRateView> {
  Widget firstTitle = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Thông tin người đi nhờ xe',
      softWrap: true,
    ),
  );

  Widget secondTitle = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Chấm điểm người đi nhờ xe',
      softWrap: true,
    ),
  );

  Widget thirdTitle = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Nhận xét chi tiết',
      softWrap: true,
    ),
  );

  Widget fourthTitle = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Lời nhắn của bạn',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đánh giá chuyến xe'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            )),
      ),
      body: ListView(
        children: [
          firstTitle,
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(236, 245, 255, 1),
              ),
              height: 100,
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
              ),
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/logo/facebook.png',
                        width: 90, height: 90),
                  ),

                  const Text(
                    'Huynh Van Khong',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Column(children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const Text(
                        '(5,0)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          secondTitle,
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 50,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ),
          thirdTitle,

          // ElevatedButton(
          //   onPressed: () {
          //       // Respond to button press
          //   },
          //   child: Text('CONTAINED BUTTON'),
          // ),

          Container(
              height: 100,
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.,

                children: [
                  Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Mang tiền lẻ'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Mang tiền lẻ'),
                      ),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Mang tiền lẻ'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Mang tiền lẻ'),
                      ),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Mang tiền lẻ'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Mang tiền lẻ'),
                      ),
                    ),
                  ]),
                ],
              )),

          fourthTitle,
          Column(
            children: const <Widget>[
              Card(
                margin: EdgeInsets.only(left: 32, right: 32),
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      minLines:
                          6, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
