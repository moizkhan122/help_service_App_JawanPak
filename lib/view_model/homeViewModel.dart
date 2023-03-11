
import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel{
     final _navigationService = locator<NavigationService>();
   
  navigateToAmbulanceServiceView() {
    _navigationService.navigateToAmbulanceServiceView();
  }
  navigateToFireBridageServiceView() {
    _navigationService.navigateToFireBridageServiceView();
  }
  navigateToPoliceServicesView() {
    _navigationService.navigateToPoliceServicesView();
  }
}