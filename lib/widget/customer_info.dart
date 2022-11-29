import 'package:flutter/material.dart';

class CustomerInfoCard extends StatelessWidget {


  final String fullName;

  const CustomerInfoCard({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 245, 230, 248),
        ),
        height: 90,
        margin: const EdgeInsets.only(
          left: 0,
          right: 0,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // includes ava + column (name, rating)
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/avatar/avatar-01.png',
                              ),
                              radius: 24,
                            ),
                        ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fullName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: const Text(
                                  '(5,0)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ])
                          ],
                        )
                      ])
                ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.purple)),
                      child: const Icon(
                        Icons.call,
                        color: Colors.purple,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.purple)),
                      child: const Icon(
                        Icons.message_rounded,
                        color: Colors.purple,
                      ),
                    ),
                  ])
                ]),
          ],
        ),
      );
}
