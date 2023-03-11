import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/UserGooCurLocViewModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class UserGoogleCurrentLocationView extends StatelessWidget {
  const UserGoogleCurrentLocationView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserGooCurLocViewModel>.reactive(
      viewModelBuilder: () => UserGooCurLocViewModel(),
      // ignore: deprecated_member_use
      onModelReady: (viewModel) => viewModel.getLocation(),
      builder: (context, viewModel, child) => Scaffold(
        body: GoogleMap(
          initialCameraPosition: viewModel.lgoogleplex,
        markers: Set<Marker>.of(viewModel.marker),
        onMapCreated: (GoogleMapController controller) {
            viewModel.controler.complete(controller);
        }),
        // floatingActionButton: FloatingActionButton(onPressed: ()async{
        //   await viewModel.getLocation();
        // },
        // child:const Icon(Icons.add),
        // ),
        ),
      );
  }
}

/**import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/UserGooCurLocViewModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class UserGoogleCurrentLocationView extends StatefulWidget {
  const UserGoogleCurrentLocationView({super.key});

  @override
  State<UserGoogleCurrentLocationView> createState() => _UserGoogleCurrentLocationState();
}

class _UserGoogleCurrentLocationState extends State<UserGoogleCurrentLocationView> {
  @override
  final Completer<GoogleMapController> _controler = Completer(); //instance of a google map

  static const CameraPosition _lgoogleplex = CameraPosition(
    target: LatLng(33.6844, 72.0479),
    zoom: 14
    );

    final List<Marker> _marker =  <Marker>[
      Marker(
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

  Widget build(BuildContext context) {
    return ViewModelBuilder<UserGooCurLocViewModel>.reactive(
      viewModelBuilder: () => UserGooCurLocViewModel(),
      //onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        body: GoogleMap(initialCameraPosition: _lgoogleplex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
            _controler.complete(controller);
        }),
        floatingActionButton: FloatingActionButton(onPressed: (){
          getuserCurLocation().then((value)async{
            print("values");
            print(value.latitude.toString() +" "+ value.longitude.toString());
            _marker.add(
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

              final GoogleMapController controller =await _controler.future;

              controller.animateCamera(CameraUpdate.newCameraPosition(positions));
              setState(() {
                
              });
          }).onError((error, stackTrace){
            print('error'+error.toString());
          });
        },
        child: Icon(Icons.add),
        ),
        ),
      );
  }
} */