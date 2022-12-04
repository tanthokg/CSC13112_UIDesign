import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/database/trip_dao.dart';
import 'package:uniride/features/create_trip/created_trip_card.dart';

import '../../entity/trip.dart';
import '../map/simple_map.dart';

class ListCreatedTripView extends StatefulWidget {
  const ListCreatedTripView({Key? key}) : super(key: key);

  @override
  State<ListCreatedTripView> createState() => _ListCreatedTripViewState();
}

class _ListCreatedTripViewState extends State<ListCreatedTripView> {
  final Future<List<Trip>> dataFuture = TripDAO.instance.readAllTrips();
  List<Trip>? createdTrips;

  void updateStatusTrip() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Danh sách chuyến xe của tôi',
              style: TextStyle(
                color: blackBlue,
              ),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              const SimpleMapView(),
              Container(
                color: Colors.black.withOpacity(0.2),
              ),
              FutureBuilder(
                future: dataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: blueSky,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: AlertDialog(
                        title: const Text('Error loading'),
                        icon: Icon(
                          Icons.error_outline_rounded,
                          color: red,
                        ),
                        content: Text(snapshot.error.toString()),
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    createdTrips = snapshot.data;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      //itemCount: createdTrips?.length,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Center(
                            child: Wrap(
                              children: [
                                CreatedTripCard(
                                  trip: Trip(
                                    rider: 'Nguyen Van A',
                                    hitchhiker: 'Nguyen Thi B',
                                    createdTime: DateTime(2022, 11, 30),
                                    startTime: DateTime(2022, 11, 30, 10, 20),
                                    departure: 'Trường ĐH Khoa học tự nhiên',
                                    dest: '440 Nguyễn Đình Chiểu',
                                    price: 8000,
                                    distance: 3,
                                    status: 'Đang đợi bạn phản hồi',
                                  ),
                                  updateCallback: updateStatusTrip,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: Text('Not has anything'),
                  );
                },
              ),
            ],
          )),
    );
  }
}
