import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';

class DriverStartEndCard extends StatelessWidget {
  // field
  final String mainStartAddress;
  final String additionalStartAddress;
  final String mainEndAddress;
  final String additionalEndAddress;


  const DriverStartEndCard({
    Key? key,
    required this.mainStartAddress,
    required this.mainEndAddress,
    required this.additionalStartAddress,
    required this.additionalEndAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 25,
              height: 130,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.my_location, color: blueSky),
                    Container(
                        height: 60,
                        margin: const EdgeInsets.only(left: 9),
                        child: DottedLine(
                          direction: Axis.vertical,
                          lineLength: 60,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: blueSky,
                          dashGapLength: 1.5,
                        )),
                    Icon(Icons.location_on_outlined,
                        color: blueSky),
                  ]),
            ),
            // infomation of destination & pickup place
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // pick up
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            mainStartAddress,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: blackBlue,

                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            additionalStartAddress,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // destination
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              mainEndAddress,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: blackBlue,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              additionalEndAddress,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
