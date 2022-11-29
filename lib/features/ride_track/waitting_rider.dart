import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/map/simple_map.dart';
import 'package:uniride/features/notification/notification_list.dart';
import 'package:uniride/features/ride_track/driver_arrived.dart';

class WaittingRiderView extends StatefulWidget {
  const WaittingRiderView({Key? key}) : super(key: key);

  @override
  State<WaittingRiderView> createState() => _WatitingRiderViewState();
}

class _WatitingRiderViewState extends State<WaittingRiderView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _riderArrived(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                const SimpleMapView(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: FloatingActionButton.small(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: blueSky,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Card(
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                      ),
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Card(
                              surfaceTintColor: blueSky,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage('assets/avatar/avatar-01.png'),
                                    ),
                                    const SizedBox(width: 16,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nguyễn Văn A',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: blackBlue,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star_rounded, color: Colors.yellowAccent.shade400,),
                                            const SizedBox(width: 4,),
                                            Text(
                                              '4.8',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 8,),

                                    const Spacer(),

                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: blueSky),
                                      ),
                                      width: 48,
                                      height: 48,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.phone_rounded,
                                          color: blueSky,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12,),

                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: blueSky),
                                      ),
                                      width: 48,
                                      height: 48,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: FaIcon(
                                          FontAwesomeIcons.comments,
                                          color: blueSky,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 4,),

                            // thông tin thời gian đến
                            Text(
                              'Tài xế sẽ đến trong 2 phút ...',
                              style: TextStyle(
                                color: blueSky,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 18,),

                            Row(
                              children: [
                                Icon(Icons.radio_button_on_rounded, color: purple,),
                                const SizedBox(width: 16,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vị trí chờ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Text(
                                      '480 Nguyễn Thị Minh Khai',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: blackBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }

  Future<void> _riderArrived() async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const DriverArrivedView();
      }));
    });
  }
}
