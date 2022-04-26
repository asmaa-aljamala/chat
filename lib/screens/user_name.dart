//  import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
//  import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'chat_screen.dart';
//
//
//  class Pepole extends StatefulWidget {
//    static const String screenRoute = 'pepole_screen';
//    Pepole({Key? key}) : super(key: key);
//
//   @override
//   State<Pepole> createState() => _PepoleState();
// }
//
// class _PepoleState extends State<Pepole> with WidgetsBindingObserver{
//   Map<String, dynamic>? userMap;
//   bool isLoading = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   @override
//    void initState() {
//      super.initState();
//      WidgetsBinding.instance!.addObserver(this);
//      setStatus("Online");
//    }
//
//    void setStatus(String status) async {
//      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
//        "status": status,
//      });
//    }
//
//    @override
//    void didChangeAppLifecycleState(AppLifecycleState state) {
//      if (state == AppLifecycleState.resumed) {
//        // online
//        setStatus("Online");
//      } else {
//        // offline
//        setStatus("Offline");
//      }
//    }
//
// var currentUser =FirebaseAuth.instance.currentUser?.uid;
//
//    CollectionReference users =FirebaseFirestore.instance.collection('users');
//
//    void createUserInFirestore(){
//      users.where('uid',isEqualTo: FirebaseAuth.instance.currentUser?.uid)
//          .limit(1)
//          .get()
//          .then((QuerySnapshot querySnapshot){
//        if(querySnapshot.docs.isEmpty){
//          users.add({
//            'name': signedInUser.email,
//            'email':FirebaseAuth.instance.currentUser?.email,
//            'status':'Available',
//            'uid':FirebaseAuth.instance.currentUser?.uid,
//          });
//        }
//      })
//          .catchError((error){});
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('messages').snapshots(),
//         builder: (context ,snapshot){
//           List<PepoleChat>messagewidgets=[];
//           if(!snapshot.hasData){
//             return Center(child: CircularProgressIndicator(
//               backgroundColor: Colors.blue,
//             ),);
//             //add here a spinner
//           }
//           final pepoles =snapshot.data!.docs.reversed;
//           for(var pepole in pepoles ){
//             final pepolename=pepole.get('name');
//             final pepoleText=pepole.get('email');
//             final pepoleimage=pepole.get('status');
//             // final currentUser =signedInUser.email;
//             final pepolewidget=PepoleChat(names:pepolename ,text:pepoleText ,image:pepoleimage);
//
//             messagewidgets.add(pepolewidget);
//           }
//
//           return Expanded(
//             child: ListView(
//               reverse: true,
//               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
//               children: messagewidgets,
//             ),
//           );
//
//         });
//   }
// }
//
//  class PepoleChat extends StatelessWidget {
//    static const String screenRoute = 'pepole_screen';
//    PepoleChat({ required this.names,required this.image,required this.text,Key? key}) : super(key: key);
//    List names = [];
//    List text = [];
//    List image =[];
//    @override
//    Widget build(BuildContext context) {
//      return  Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.white,
//          title: Text('ListView.builder', style: TextStyle(color: Colors.black)),
//          centerTitle: true,
//          elevation: 0,
//          // foregroundColor: Colors.black,
//        ),
//        body: ListView.builder(
//          itemBuilder: (context, index) {
//            return Container(
//              padding: EdgeInsets.all(20),
//              color: Colors.white,
//              child: Row(
//                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  CircleAvatar(
//                    radius: 30,
//                    backgroundImage: AssetImage(image[index]),
//                  ),
//
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text(names[index]),
//                      Text(text[index]),
//                    ],
//                  ),
//                ],
//              ),
//            );
//          },
//          itemCount: names.length,
//        ),
//      );
//    }
//  }
//
