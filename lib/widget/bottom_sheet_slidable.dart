import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:uniride/constants/colors.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:uniride/widget/customer_info.dart';
import 'package:uniride/widget/customer_pick_up_destination_card.dart';

// for begin and end the trip
class BottomSheetSlidable extends StatelessWidget {

  // field
  final String buttonContent;
  final String fullName;
  final String pickUp;
  final String destination;

  const BottomSheetSlidable({
    Key? key,
    required this.buttonContent,
    required this.fullName,
    required this.pickUp,
    required this.destination,
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


            HorizontalSlidableButton(
              width: 90,
              height: 55,
              buttonWidth: 60.0,
              color: blueSky,
              buttonColor: blueSky,
              dismissible: true,
              label: Container(
                margin: const EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromRGBO(236, 245, 255, 1),
                    border: Border.all(
                        width: 1.5,
                        color: const Color.fromRGBO(236, 245, 255, 1))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5), 
                  child: Icon(Icons.arrow_forward_ios, color: blueSky),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      buttonContent,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onChanged: (position) {},
            ),
          ],
        ),
      );
}
