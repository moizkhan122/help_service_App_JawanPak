import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}
class _page2State extends State<page2> {

 final Completer<GoogleMapController> _controler = Completer();

  List<Marker> _marker = [];
  List<Marker> list =const [
    Marker(markerId: MarkerId('1'),
    position: LatLng(24.828314, 67.154739),
    infoWindow: InfoWindow(
      title: "My current location",
    )
    ),
  ];

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _marker.addAll(list);
    getUserLocations();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.828314,67.154739),
    zoom: 14,
    
    );

      //postion is basically a ltd/lgtd
    Future<Position> getUserLocations()async{
      await Geolocator.requestPermission().then((value){

      }).onError((error, stackTrace){
        print("error :$error");
      });

      return await Geolocator.getCurrentPosition();
    }

  @override
  Widget build(BuildContext context){
        return Scaffold(
            body: SafeArea(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller){
                  _controler.complete(controller);
                },
                markers: Set<Marker>.of(_marker),
                initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              ),
            ),
            floatingActionButton: FloatingActionButton(
        onPressed: (){
            getUserLocations().then((value)async{
              print("Located getted");
              if (kDebugMode) {
                print("${value.latitude} ${value.longitude}");
              }

              _marker.add(
                Marker(markerId: const MarkerId('2'),
              position: LatLng(value.latitude,value.longitude),
              // ignore: prefer_const_constructors
              infoWindow: InfoWindow(
                title: "My current location",
              )
              ),
              );
                //move camera on that location
              CameraPosition cameraPosition = CameraPosition(
                target: LatLng(value.latitude,value.longitude));
                final GoogleMapController controller = await _controler.future;
                //controller to control the camera postion
                controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {
                  
                });
            });
        },
        ),
        );
  }
}

