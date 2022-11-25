import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class SearchPlacesView extends StatefulWidget {
  const SearchPlacesView({Key? key}) : super(key: key);

  @override
  State<SearchPlacesView> createState() => _SearchPlacesViewState();
}

const kGoogleApiKey = 'AIzaSyDW1Ifob1cpKcPeCsZ0RVfG2jTwtWPfIKU';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPlacesViewState extends State<SearchPlacesView> {

  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(10.765, 106.664), zoom: 14);

  Set<Marker> markers = {};

  final Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: homeScaffoldKey,
        appBar: AppBar(
          title: const Text('Google Search Places'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            ElevatedButton(
              onPressed: _handlePressButton,
              child: const Text('Search Places'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context, apiKey: kGoogleApiKey, onError: onError, mode: _mode, language: 'vn',
      strictbounds: false, types: [''],
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24), borderSide: const BorderSide(color: Colors.white,),
        ),
      ),
      components: [Component(Component.country, "vn")]
    );

    displayPrediction(prediction!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
      content: Text(response.errorMessage!),
    ));
  }

  Future<void> displayPrediction(Prediction prediction, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders()
    );

    PlacesDetailsResponse detailResponse = await places.getDetailsByPlaceId(prediction.placeId!);

    final lat = detailResponse.result.geometry!.location.lat;
    final lng = detailResponse.result.geometry!.location.lng;

    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId('0'),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: detailResponse.result.name),
    ));

    setState(() {});

    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14));
  }
}
