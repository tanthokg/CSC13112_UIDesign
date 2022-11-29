import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uniride/constants/colors.dart';
import 'package:uniride/features/create_trip/create_route.dart';

class FindLocationView extends StatefulWidget {
  const FindLocationView({Key? key}) : super(key: key);

  @override
  State<FindLocationView> createState() => _FindLocationViewState();
}

class _FindLocationViewState extends State<FindLocationView> {
  final _source = TextEditingController();
  final _dest = TextEditingController();

  late GoogleMapController googleMapController;

  static const _initialCameraPosition =
      CameraPosition(target: LatLng(10.765, 106.664), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Chọn địa điểm',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: blackBlue),
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
                      style: IconButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.white),
                      icon: Icon(Icons.my_location, color: blueSky)),
                  const SizedBox(height: 16),
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 3.0,
                    clipBehavior: Clip.hardEdge,
                    shadowColor: Colors.grey[200],
                    child: TextField(
                      controller: _source,
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '(vị trí hiện tại)',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[400],
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 12),
                          child: Icon(Icons.location_searching_rounded,
                              color: blueSky, size: 24),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueSky, width: 2),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 3.0,
                    clipBehavior: Clip.hardEdge,
                    shadowColor: Colors.grey[200],
                    child: TextField(
                      controller: _dest,
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[400],
                        ),
                        hintText: 'Điểm đến',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 12),
                          child: Icon(Icons.location_on_rounded,
                              color: blueSky, size: 24),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueSky, width: 2),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateRoute()));
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
