import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/text.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/view_model/FireBrigadeAdminViewModel.dart';
import 'package:flutter_application_1/views/LoginView/loginView.dart';
import 'package:flutter_application_1/views/firebrigadeAdminGooLocView/firebrigadeAdminGooLocView.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable

class FireBrigadeAdminView extends StatelessWidget {
  const FireBrigadeAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FireBrigadeAdminViewModel>.reactive(
      viewModelBuilder: () => FireBrigadeAdminViewModel(),
      // ignore: deprecated_member_use
      //onModelReady: (viewModel) => viewModel.setPolygon(),
      builder: (context, viewModel, child) => Scaffold(
        body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Lottie.network('https://assets4.lottiefiles.com/packages/lf20_pex2sf.json'),
           SizedBox(height: 50,),

            StreamBuilder<QuerySnapshot>(
              stream:viewModel.fireBrigadefireStore,
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                if(snapshot.hasError){
                  return Text("Some Error");
                }
                return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final title = snapshot.data!.docs[index]['Name'].toString();
                return Column(
                  children: [
                    textWidget(text: "User Credentials",size: 35,color: AppColors.RedColor,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textWidget(text:"Name",size: 25,color: AppColors.blackColor,),
                        textWidget(text: snapshot.data!.docs[index]['Name'].toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textWidget(text:"user Case",size: 25,color: AppColors.blackColor,),
                        textWidget(text: snapshot.data!.docs[index]['Case'].toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textWidget(text:"User Number",size: 25,color: AppColors.blackColor,),
                        textWidget(text: snapshot.data!.docs[index]['Number'].toString()),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
        onPressed: (){
          viewModel.setLatlong(
           latt : double.parse(snapshot.data!.docs[index]['Latitudee']),
           longg : double.parse(snapshot.data!.docs[index]['Longitudee'])   
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const FireBrigadeAdminGooCurrLocView(),));
        },
        style: ElevatedButton.styleFrom(
           fixedSize: const Size(150, 50),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.redAccent,
            elevation: 0,
            side:  BorderSide(
              width: 2.0,
              color: AppColors.RedColor,
            )),
        child:viewModel.click? Text("Accepted",style:const TextStyle(fontSize: 18),) : 
        Text("Accept",style:const TextStyle(fontSize: 18),)
        ),
                          ElevatedButton(
        onPressed: (){
            viewModel.ref.doc(snapshot.data!.docs[index]['Id'].toString()).delete().then((value){
                              viewModel.logout();
                           }).onError((error, stackTrace){
                              //FirebaseServices().ToastMessge(error);
                            });
        },
        style: ElevatedButton.styleFrom(
           fixedSize: const Size(150, 50),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.redAccent,
            elevation: 0,
            side:  BorderSide(
              width: 2.0,
              color: AppColors.RedColor,
            )),
        child: Text("Deny",style:const TextStyle(fontSize: 18),)),
                      ],
                    ),
                    SizedBox(height: 35,),

                      Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: (){
                            logout(){
                        viewModel.auth.signOut().then((value){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView(),));
                        }).onError((error, stackTrace){
                          if (kDebugMode) {
                            print(error.toString());
                          }
                        });
                      }
                        }, 
                        icon: Icon(Icons.logout)),
                    )
                  ],);
              },),
            );
            },),
            
          ]),
      ),
 
        ),
      );
  }
}