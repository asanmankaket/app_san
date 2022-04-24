import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/sidemenu.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> marker = {};

  @override
  void initState() {
    super.initState();
    addMap();
  }

  addMap() async {
    marker.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(7.1713657, 100.711544),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)));

    marker.add(Marker(
      markerId: MarkerId('2'),
      position: LatLng(7.1713657, 100.721544),
      icon: await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/image/LOGO.png'),
    ));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(7.1713657, 100.611544),
    zoom: 15,
  );

  static final CameraPosition _kLake =
      CameraPosition(target: LatLng(7.1713657, 100.611544), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng value) {
          print(value);
          setState(() {
            marker.add(
              Marker(
                markerId: MarkerId('MarkLocation'),
                position: value,
              ),
            );
          });
          print(marker.first);
        },
        markers: marker,
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake, label: Text('กลับจุดเดิม')),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('กลับมายังการนำทาง'),
      //   icon: Icon(Icons.directions_boat),
      // ),
      drawer: SideMenu(),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
