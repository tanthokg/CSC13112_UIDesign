import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PickUpDestinationCard extends StatelessWidget {
  // field
  final String pickUp;
  final String destination;

  const PickUpDestinationCard({
    Key? key,
    required this.pickUp,
    required this.destination,
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
                    const Icon(Icons.my_location, color: Colors.purple),
                    Container(
                        height: 60,
                        margin: const EdgeInsets.only(left: 9),
                        child: const DottedLine(
                          direction: Axis.vertical,
                          lineLength: 60,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.purple,
                          dashGapLength: 1.5,
                        )),
                    const Icon(Icons.location_on_outlined,
                        color: Colors.purple),
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
                          child: const Text(
                            'Điểm đón khách',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            pickUp,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
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
                            child: const Text(
                              'Điểm trả khách',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              destination,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
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
