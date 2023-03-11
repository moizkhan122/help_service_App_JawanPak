import 'package:flutter_application_1/services/AuthService.dart';
import 'package:flutter_application_1/services/ToastService.dart';
import 'package:flutter_application_1/views/userGoogleCurrentLocation/userGoogleCurrentLocation.dart';
import 'package:flutter_application_1/views/AmbulanceServiceView/AmbulanceService.dart';
import 'package:flutter_application_1/views/FireBridageServiceView/FireBridageServiceView.dart';
import 'package:flutter_application_1/views/Home/Home.dart';
import 'package:flutter_application_1/views/LoginView/loginView.dart';
import 'package:flutter_application_1/views/ObBoardView/OnBoardView.dart';
import 'package:flutter_application_1/views/PoliceServiceView/PoliceServiceView.dart';
import 'package:flutter_application_1/views/SignUp/signUp.dart';
import 'package:flutter_application_1/views/SplashView/SplashScreenView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: OnboardView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: signUp),
    MaterialRoute(page: home),
    MaterialRoute(page: AmbulanceServiceView),
    MaterialRoute(page: FireBridageServiceView),
    MaterialRoute(page: PoliceServicesView),
    MaterialRoute(page: UserGoogleCurrentLocationView),
  ],
  dependencies: [
    Singleton(
      classType: NavigationService,
    ),
    LazySingleton(
     classType: ToastService,
    ),
     LazySingleton(
     classType: AuthService,
    ),
  ],
)
class App {}