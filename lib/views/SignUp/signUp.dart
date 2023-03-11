import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/ContainerButton.dart';
import 'package:flutter_application_1/resources/text.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/views/LoginView/loginView.dart';

class signUp extends StatefulWidget {
   signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
TextEditingController Password = TextEditingController();

 TextEditingController email = TextEditingController();

  bool isSellected = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const SizedBox(height: 13,),
                  
                  const SizedBox(height: 20,),
                  textWidget(text: "SIGN Up HERE",size: 30,color: AppColors.RedColor,) ,
                  const SizedBox(height: 10,),
                              
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(text: "User Name",size: 25,color: AppColors.RedColor,),
                        const SizedBox(height: 15,),
                        TextFormField(
                          controller: email,
                           
                         validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                           if(!value.contains("@")){
                            return "Add @";
                           }
                           else{
                            return null;
                           }
                        }, 
                          decoration: const InputDecoration(
                            border : OutlineInputBorder(),
                            hintText: "Enter Email",),
                        ),
                        const SizedBox(height: 15,),
                        textWidget(text: "Email",size: 25,color: AppColors.RedColor,),
                        const SizedBox(height: 15,),
                        TextFormField(
                          controller: email,
                           
                         validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                           if(!value.contains("@")){
                            return "Add @";
                           }
                           else{
                            return null;
                           }
                        }, 
                          decoration: const InputDecoration(
                            border : OutlineInputBorder(),
                            hintText: "Enter Email",),
                        ),
                        const SizedBox(height: 15,),
                        textWidget(text: "password",size: 25,color: AppColors.RedColor,),
                        const SizedBox(height: 15,),
                        TextFormField(
                          controller: Password,
                         validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Password";
                            }
                           if(value.length<5){
                            return "length should be above 5";
                           }
                           else{
                            return null;
                           }
                        },
                            obscureText: isSellected,
                          decoration: InputDecoration(
                             suffixIcon: GestureDetector(
                               onTap: (){},
                                child: Icon(isSellected ? Icons.visibility_off : Icons.visibility,color: AppColors.blackColor,)),
                            border : const OutlineInputBorder(),
                            hintText: "Enter password",),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(text: "Already Have an Account?",size: 18,color: AppColors.blackColor,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView(),));
                        },
                        child: textWidget(text: " Login In",size: 18,color: AppColors.RedColor,)),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  ContainerButton(
                    text: "Sign Up",
                    size: 27, 
                    onpress: (){
                      if (formkey.currentState!.validate()) {
              
                    }
                      
                    }, 
                    radius: BorderRadius.circular(15),
                    
                    color: AppColors.RedColor,),
              ]),
          ),
        ),
      ),
    );
  }
}