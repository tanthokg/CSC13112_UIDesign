import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/widget/customer_info.dart';
import 'package:uniride/widget/pick_up_destination_card.dart';


class SimpleBottomSheet extends StatelessWidget {
  // field
  final String fullName;
  final String pickUp;
  final String destination;

  const SimpleBottomSheet({
    Key? key, 
    required this.fullName,
    required this.pickUp,
    required this.destination
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // name card
            CustomerInfoCard(fullName: fullName),
            // information
            PickUpDestinationCard(
              pickUp: pickUp,
              destination: destination,
            ),


            // the button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: blueSky,
              ),
              height:50, width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: const [
                  Text(
                    'Đã đến địa điểm đón',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white
                    ),),
                ],
              ),
            )
          ],
        ),
      );
}
