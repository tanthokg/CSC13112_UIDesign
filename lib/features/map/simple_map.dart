import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapView extends StatefulWidget {
  const SimpleMapView({Key? key}) : super(key: key);

  @override
  State<SimpleMapView> createState() => _SimpleMapViewState();
}

class _SimpleMapViewState extends State<SimpleMapView> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(10.765, 106.664), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(10.755, 106.665), zoom: 14.0, bearing: 192.0, tilt: 60);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
