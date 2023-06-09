
import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:flutter_application_1/utills/Colors.dart';
//import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class FireBrigadeAdminViewModel extends BaseViewModel {

  //  convertCordinateInToAdress(lat,lon)async{
    
  //   final cordinates = Coordinates(lat,lon);
  //   var adress = await Geocoder.local.findAddressesFromCoordinates(cordinates);

  //   var firstt  = adress.first;
  //   return firstt.featureName.toString() + firstt.addressLine.toString(); 
  // }
///////////////////////////////////////////////////////////////////

    navigateToFireBaseAdminGooLocView(){
        
    }

    static double _latt = 0;
    static double _longg = 0;

    static double get latt => _latt;
    static double get longg => _longg;

    setLatlong({required double latt,required double longg}){
      _latt = latt;
      _longg = longg;
    }

   final fireBrigadefireStore = FirebaseFirestore.instance.collection('FireBrigade').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('FireBrigade');

  final auth = FirebaseAuth.instance;
  
          bool click = false;

  isclick(){
    click = !click;
    rebuildUi();
  }


  //instance of a google map
    final Completer<GoogleMapController> controler = Completer(); 
     final _navigationService = locator<NavigationService>();

  List<LatLng> points  = [
    const LatLng(24.8387, 67.1209),//37.421998333333335//-122.084
     LatLng(latt,longg),
  ];

    navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }

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
    target: LatLng(24.8387, 67.1209),
    zoom: 14
    );

    final List<Marker> marker =  <Marker>[
      const Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.8387, 67.1209),
        infoWindow: InfoWindow(title: 'the title of marker'),
        )
    ];      

   logout(){
    auth.signOut().then((value){
        navigateToLoginView();
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
   

}