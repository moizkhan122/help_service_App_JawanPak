

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:flutter_application_1/services/AuthService.dart';
import 'package:flutter_application_1/services/ToastService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel{
  
  
  final toastService = locator<ToastService>();
  final authService = locator<AuthService>(); 

     TextEditingController passwordContr = TextEditingController();
     TextEditingController emailContr = TextEditingController();

  final _navigationService = locator<NavigationService>();
  
  navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }
  
  bool isSellected = true;

  String? emailVerifi(String? value){
                  if(value == null || value.isEmpty){
                    return "Enter Email";
                  }
                  if(!value.contains('@')){
                    return 'please Enter valid email';
                  }
                  else{
                    return null;
                 }
                 
  }
   String? passVerifi(String? value){
                  if(value == null || value.isEmpty){
                    return "Enter PAssword";
                  }
                  if(value.length<6){
                    return 'length should be abouve 6';
                  }
                  else{
                    return null;
                 }
  }

    void isSignUp(BuildContext context)async{
      if (!(Form.of(context)?.validate() ?? false)) {
        return;
      }
      var res = await runBusyFuture(authService.loginORcreateuser(emailContr.text.toString(), passwordContr.text.toString()));
      if(res){
        navigateToLoginView();
      }
    }
}