import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class PoliceAdminViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

   convertCordinateInToAdress(lat,lon)async{
    
    final cordinates = Coordinates(lat,lon);
    var adress = await Geocoder.local.findAddressesFromCoordinates(cordinates);

    var firstt  = adress.first;
    return firstt.featureName.toString() + firstt.addressLine.toString(); 
  }

  navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }
  
final auth = FirebaseAuth.instance;
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