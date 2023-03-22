
import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class AmbulanceAdminViewModel extends BaseViewModel{

   static double _latt = 0;
    static double _longg = 0;

    static double get latt => _latt;
    static double get longg => _longg;

    setLatlong({required latt,required longg}){
      _latt = latt;
      _longg = longg;
    }

   final fireBrigadefireStore = FirebaseFirestore.instance.collection('Ambulance').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('Ambulance');

  final auth = FirebaseAuth.instance;
  
          bool click = true;

  isclick(){
    click = !click;
    rebuildUi();
  }


  //instance of a google map
    final Completer<GoogleMapController> controler = Completer(); 

  List<LatLng> points  = [
    const LatLng(33.6844, 72.0479),//37.421998333333335//-122.084
     LatLng(latt,longg),
  ];
  
  Set<Polygon> polygon = HashSet<Polygon>();
    setPolygon(){
      for (var i = 0; i < points.length; i++) {
        marker.add(
         Marker(
        markerId: MarkerId(i.toString()),
        position: points[i],
        infoWindow: InfoWindow(title: 'the title of marker'),
        )
      );

      polygon.add(
      Polygon(polygonId : const PolygonId('1'),
        points: points,
        fillColor: AppColors.RedColor.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 3,
        strokeColor: AppColors.orangeColor.withOpacity(0.3)
      ));
      }
    }

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

}