import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/elevatedButton.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/view_model/homeViewModel.dart';
import 'package:flutter_application_1/views/AmbulanceServiceView/AmbulanceService.dart';
import 'package:flutter_application_1/views/FireBridageServiceView/FireBridageServiceView.dart';
import 'package:flutter_application_1/views/PoliceServiceView/PoliceServiceView.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      //onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, _) => Scaffold(
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            Lottie.network('https://assets2.lottiefiles.com/packages/lf20_kjoghjmo.json',),
            
            elevatedButton(
              onpress: () => viewModel.navigateToAmbulanceServiceView(),
              txt1: 'AMBULANCE SERVICE',color: AppColors.RedColor,),
            const SizedBox(height: 10,),
            elevatedButton(
              onpress: () => viewModel.navigateToPoliceServicesView(),
              txt1: 'POLICE SERVICE',color: AppColors.RedColor,),
            const SizedBox(height: 10,),
            elevatedButton(
              onpress: () => viewModel.navigateToFireBridageServiceView(),
              txt1: 'FIRE BIRGADE SERVICE',color: AppColors.RedColor,),
            const SizedBox(height: 10,),
          ]),
      ),
    ),
    );
  }
}

/** */

