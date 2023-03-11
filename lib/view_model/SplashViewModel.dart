
import 'dart:async';

import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel{


   final _navigationService = locator<NavigationService>();
   splashToOnBoard(){
    Timer(const Duration(seconds: 5), () => navigateToOnboardViews());
  }
  navigateToOnboardViews() {
    _navigationService.navigateToOnboardView();
  }
  
 
}