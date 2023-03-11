import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class UserGooCurLocViewModel extends BaseViewModel {
  

final Completer<GoogleMapController> controler = Completer(); //instance of a google map


  final  CameraPosition lgoogleplex = const CameraPosition(
    target: LatLng(33.6844, 72.0479),
    zoom: 14
    );

    final List<Marker> marker =  <Marker>[
      const Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 72.0479),
        infoWindow: InfoWindow(title: 'the title of marker'),
        )
    ];

  
  

    Future<Position> getuserCurLocation()async{
      await Geolocator.requestPermission().then((value){

      }).onError((error, stackTrace){
        if (kDebugMode) {
          print('error : $error');
        }
      });
      return await Geolocator.getCurrentPosition();
    } 

    getLocation()async{
      getuserCurLocation().then((value)async{
            if (kDebugMode) {
              print("values");
            }
            if (kDebugMode) {
              print("${value.latitude} ${value.longitude}");
            }
            marker.add(
              Marker(markerId: MarkerId('2'),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                title: 'my current location',
              )
              )
            );
            CameraPosition positions = CameraPosition(
              zoom: 14,
              target: LatLng(value.latitude,value.longitude));

              final GoogleMapController controller =await controler.future;

              controller.animateCamera(CameraUpdate.newCameraPosition(positions));
             rebuildUi();
          }).onError((error, stackTrace){
            if (kDebugMode) {
              print('error$error');
            }
          });
    }

        
}