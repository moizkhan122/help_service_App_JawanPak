import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/Colors.dart';

class AmbulanceAdminView extends StatelessWidget {
   AmbulanceAdminView({super.key});
  
  final fireStore = FirebaseFirestore.instance.collection('user').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
           SizedBox(height: 50,),

            StreamBuilder<QuerySnapshot>(
              stream: fireStore,
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
                print(snapshot.data!.docs[index]['Name'].toString());
                return ListTile(
                
                  title: Text(snapshot.data!.docs[index]['Name'].toString(),style: TextStyle(color: AppColors.blackColor),),
                  subtitle: Text(snapshot.data!.docs[index]['id'].toString(),style: TextStyle(color: AppColors.blackColor)),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      // PopupMenuItem(
                      //   value: 1,
                      //   child: ListTile(
                      //     onTap: (){
                      //       Navigator.pop(context);
                      //       showMydialog(title,snapshot.data!.docs[index]['id'].toString());
                      //     },
                      //     leading: Icon(Icons.edit),
                      //     title:Text("edit"),
                      //   )),
                        PopupMenuItem(
                        value: 1,
                        onTap: (){
                          //ref.child(snapshot.child('id').value.toString()).remove();
                        },
                        child: ListTile(
                          leading: Icon(Icons.delete),
                          onTap: (){
                            ref.doc(snapshot.data!.docs[index]['id'].toString()).delete().then((value){
                              //FirebaseServices().ToastMessge("Data deleted");
                            }).onError((error, stackTrace){
                              //FirebaseServices().ToastMessge(error);
                            });
                          },
                          title:Text("delete"),
                        ))
                    ],
                  ),
                );
              },),
            );
            },),
            
          ]),
      ),
    );
  }
}