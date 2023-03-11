import 'package:flutter/material.dart';
import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{
   final _navigationService = locator<NavigationService>();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
   
  navigateToOnboardViews() {
    _navigationService.navigateToHome();
  }
  navigateToSignUp() {
    _navigationService.navigateToSignUp();
  }

   TextEditingController password = TextEditingController();
   

 TextEditingController email = TextEditingController();
 
  
  bool isSellected = true;

  emailVerifi(value){
                  if(value!.isEmpty){
                    return "Enter Password";
                  }
                  if(value.length<5){
                  return "length should be above 5";
                 }
                  else{
                    return null;
                 }
                 
  }
  passVerifi(value){
                  if(value!.isEmpty){
                              return "Enter Password";
                            }
                           if(value.length<5){
                            return "length should be above 5";
                           }
                           else{
                            return null;
                           }
                 
  }

  formvalidate(){
    if (formkey.currentState!.validate()) {
      navigateToOnboardViews();  
     }
     rebuildUi();
  }
}