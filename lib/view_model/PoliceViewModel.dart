import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PoliceViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  
  navigateToUserGoogleCurrentLocationView() {
    _navigationService.navigateToUserGoogleCurrentLocationView();
  }
}