import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final double latitude;
  final double longitude;

  MapSample({required this.latitude, required this.longitude});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  // CameraPosition? _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  GoogleMapController? controller;
  static const LatLng _kMapCenter = LatLng(52.4478, -3.5402);
  BitmapDescriptor? _markerIcon;
  animate() async {
    CameraPosition _kGooglePlexe = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );
    controller = await _controller.future;
    controller!.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlexe));
  }

  void onMapCreated(GoogleMapController _controller) {
    controller = _controller;
    methodA(const LatLng(52.4478, -3.5402));
  }

  void methodA(LatLng position) {
    controller!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15.0)));
  }

  Marker _createMarker(LatLng p) {
    if (_markerIcon != null) {
      print("markericon is not null");
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: p,
        icon: _markerIcon!,
      );
    } else {
      print("marker icon is null");
      return Marker(
        markerId: MarkerId('marker_1'),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          print("here");
        },
        position: p,
      );
    }
  }

  @override
  void initState() {
    // animate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(latitude);
    return Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            target: _kMapCenter,
            zoom: 7.0,
          ),
          markers: <Marker>{
            _createMarker(LatLng(52.4478, -3.5402)),
            _createMarker(LatLng(52.446, -3.5402))
          },
          onMapCreated: onMapCreated),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}
