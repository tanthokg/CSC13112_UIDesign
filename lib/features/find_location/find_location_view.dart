import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/constants/routes.dart';
import 'package:uniride/features/book_ride/book_ride_list.dart';
import 'package:uniride/features/find_location/insert_location_view.dart';

class FindLocationView extends StatefulWidget {
  const FindLocationView({
    Key? key,
  }) : super(key: key);

  @override
  State<FindLocationView> createState() => _FindLocationViewState();
}

class _FindLocationViewState extends State<FindLocationView> {
  final _source = TextEditingController();
  final _dest = TextEditingController();

  late GoogleMapController googleMapController;

  static const _initialCameraPosition = CameraPosition(target: LatLng(10.765, 106.664), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final bool userRole = ModalRoute.of(context)?.settings.arguments as bool;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Tìm kiếm địa điểm',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: blackBlue),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        Position position = await _determinePosition();
                        googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(position.latitude, position.longitude),
                              zoom: 14,
                            ),
                          ),
                        );

                        markers.clear();
                        markers.add(
                          Marker(
                            markerId: const MarkerId('currentLocation'),
                            position: LatLng(position.latitude, position.longitude),
                          ),
                        );

                        setState(() {});
                      },
                      style: IconButton.styleFrom(elevation: 0, backgroundColor: Colors.white),
                      icon: Icon(Icons.my_location, color: blueSky)),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 3,
                    surfaceTintColor: Colors.white,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: Row(
                            children: [
                              Icon(Icons.radio_button_on_rounded, color: blueSky),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextField(
                                  controller: _source,
                                  keyboardType: TextInputType.text,
                                  autocorrect: true,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                    hintText: '(vị trí hiện tại)',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[400],
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  onTap: () async {
                                    _source.text = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const InsertLocationView(
                                            title: 'Chọn điểm đi',
                                          ),
                                        ));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: CustomPaint(
                              size: const Size(1, 16),
                              painter: DashedLineVerticalPainter(blueSky),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: blueSky),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextField(
                                  controller: _dest,
                                  keyboardType: TextInputType.text,
                                  autocorrect: true,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                    hintText: 'Điểm đến',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey[400],
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  onTap: () async {
                                    _dest.text = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const InsertLocationView(
                                            title: 'Chọn điểm đến',
                                          ),
                                        ));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      final src = _source.text;
                      final dest = _dest.text;
                      if (src.isEmpty || dest.isEmpty) {
                        return;
                      }

                      userRole
                          ? Navigator.pushNamed(context, Routes.createTrip, arguments: {
                              'src': src,
                              'dest': dest,
                            })
                          : Navigator.pushNamed(context, Routes.rideList, arguments: {
                              'src': src,
                              'dest': dest,
                            });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: blueSky,
                      minimumSize: const Size.fromHeight(56),
                    ),
                    child: const Text(
                      'Tiếp tục',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanently denied");
    }

    return await Geolocator.getCurrentPosition();
  }
}
